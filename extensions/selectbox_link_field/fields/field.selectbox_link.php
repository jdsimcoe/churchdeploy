<?php

	if(!defined('__IN_SYMPHONY__')) die('<h2>Symphony Error</h2><p>You cannot directly access this file</p>');

	Class fieldSelectBox_Link extends Field {

		private static $cache = array();
		private static $em = null;

	/*-------------------------------------------------------------------------
		Definition:
	-------------------------------------------------------------------------*/

		public function __construct(&$parent){
			parent::__construct($parent);
			$this->_name = __('Select Box Link');
			$this->_required = true;
			$this->_showassociation = true;

			// Default settings
			$this->set('show_column', 'no');
			$this->set('show_association', 'yes');
			$this->set('required', 'yes');
			$this->set('limit', 20);
			$this->set('related_field_id', array());

			if(!isset(self::$em) && class_exists('EntryManager')) {
				self::$em = new EntryManager(Symphony::Engine());
			}
		}

		public function canToggle(){
			return ($this->get('allow_multiple_selection') == 'yes' ? false : true);
		}

		public function canFilter(){
			return true;
		}

		public function allowDatasourceOutputGrouping(){
			return ($this->get('allow_multiple_selection') == 'yes' ? false : true);
		}

		public function allowDatasourceParamOutput(){
			return true;
		}

		public function requiresSQLGrouping(){
			return ($this->get('allow_multiple_selection') == 'yes' ? true : false);
		}

	/*-------------------------------------------------------------------------
		Setup:
	-------------------------------------------------------------------------*/

		public function createTable(){
			return Symphony::Database()->query(
				"CREATE TABLE IF NOT EXISTS `tbl_entries_data_" . $this->get('id') . "` (
					`id` int(11) unsigned NOT NULL auto_increment,
					`entry_id` int(11) unsigned NOT NULL,
					`relation_id` int(11) unsigned DEFAULT NULL,
					PRIMARY KEY (`id`),
					KEY `entry_id` (`entry_id`),
					KEY `relation_id` (`relation_id`)
				) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;"
			);
		}

	/*-------------------------------------------------------------------------
		Utilities:
	-------------------------------------------------------------------------*/

		public function set($field, $value){
			if($field == 'related_field_id' && !is_array($value)){
				$value = explode(',', $value);
			}
			$this->_fields[$field] = $value;
		}

		public function findOptions(array $existing_selection=NULL){
			$values = array();
			$limit = $this->get('limit');

			if(!is_array($this->get('related_field_id'))) return $values;

			// find the sections of the related fields
			$sections = Symphony::Database()->fetch("
				SELECT DISTINCT (s.id), s.name, f.id as `field_id`
				FROM `tbl_sections` AS `s`
				LEFT JOIN `tbl_fields` AS `f` ON `s`.id = `f`.parent_section
				WHERE `f`.id IN ('" . implode("','", $this->get('related_field_id')) . "')
				ORDER BY s.sortorder ASC
			");

			if(is_array($sections) && !empty($sections)){
				foreach($sections as $section) {
					$group = array(
						'name' => $section['name'],
						'section' => $section['id'],
						'values' => array()
					);

					// build a list of entry IDs with the correct sort order
					$entries = self::$em->fetch(NULL, $section['id'], $limit, 0, null, null, false, false);

					$results = array();
					foreach($entries as $entry) {
						$results[] = (int)$entry['id'];
					}

					// if a value is already selected, ensure it is added to the list (if it isn't in the available options)
					if(!is_null($existing_selection) && !empty($existing_selection)){
						$entries_for_field = $this->findEntriesForField($existing_selection, $section['field_id']);
						$results = array_merge($results, $entries_for_field);
					}

					if(is_array($results) && !empty($results)){
						$related_values = $this->findRelatedValues($results);
						foreach($related_values as $value){
							$group['values'][$value['id']] = $value['value'];
						}
					}

					$values[] = $group;
				}
			}

			return $values;
		}

		public function getToggleStates(){
			$options = $this->findOptions();
			$output = $options[0]['values'];
			$output[""] = __('None');
			return $output;
		}

		public function toggleFieldData($data, $new_value){
			$data['relation_id'] = $new_value;
			return $data;
		}

		public function fetchAssociatedEntryCount($value){
			return Symphony::Database()->fetchVar('count', 0, sprintf("
					SELECT COUNT(*) as `count`
					FROM `tbl_entries_data_%d`
					WHERE `relation_id` = %d
				",
				$this->get('id'), $value
			));
		}

		public function fetchAssociatedEntryIDs($value){
			return Symphony::Database()->fetchCol('entry_id', sprintf("
					SELECT `entry_id`
					FROM `tbl_entries_data_%d`
					WHERE `relation_id` = %d
				",
				$this->get('id'), $value
			));
		}

		public function fetchAssociatedEntrySearchValue($data, $field_id=NULL, $parent_entry_id=NULL){
			// We dont care about $data, but instead $parent_entry_id
			if(!is_null($parent_entry_id)) return $parent_entry_id;

			if(!is_array($data)) return $data;

			$searchvalue = Symphony::Database()->fetchRow(0, sprintf("
				SELECT `entry_id` FROM `tbl_entries_data_%d`
				WHERE `handle` = '%s'
				LIMIT 1",
				$field_id, addslashes($data['handle'])
			));

			return $searchvalue['entry_id'];
		}

		public function findEntriesForField(array $relation_id = array(), $field_id = null) {
			if(empty($relation_id) || !is_array($this->get('related_field_id'))) return array();

			try {
				// Figure out which `related_field_id` is from that section
				$relations = Symphony::Database()->fetchCol('id', sprintf("
						SELECT e.id
						FROM `tbl_fields` AS `f`
						LEFT JOIN `tbl_sections` AS `s` ON (f.parent_section = s.id)
						LEFT JOIN `tbl_entries` AS `e` ON (e.section_id = s.id)
						WHERE f.id = %d
						AND e.id IN (%s)
					",
					$field_id, implode(',',$relation_id), implode(',', $this->get('related_field_id'))
				));
			}
			catch(Exception $e){
				return array();
			}

			return $relations;
		}

		protected function findRelatedValues(array $relation_id = array()) {
			// 1. Get the field instances from the SBL's related_field_id's
			// FieldManager->fetch doesn't take an array of ID's (unlike other managers)
			// so instead we'll instead build a custom where to emulate the same result
			// We also cache the result of this where to prevent subsequent calls to this
			// field repeating the same query.
			$where = ' AND id IN (' . implode(',', $this->get('related_field_id')) . ') ';
			$hash = md5($where);
			if(!isset(self::$cache[$hash]['fields'])) {
				$fields = self::$em->fieldManager->fetch(null, null, 'ASC', 'sortorder', null, null, $where);
				if(!is_array($fields)) {
					$fields = array($fields);
				}

				self::$cache[$hash]['fields'] = $fields;
			}
			else {
				$fields = self::$cache[$hash]['fields'];
			}

			if(empty($fields)) return array();

			// 2. Find all the provided `relation_id`'s related section
			// We also cache the result using the `relation_id` as identifier
			// to prevent unnecessary queries
			$relation_id = array_filter($relation_id);
			if(empty($relation_id)) return array();

			$hash = md5(serialize($relation_id));

			if(!isset(self::$cache[$hash]['relation_data'])) {
				$relation_ids = Symphony::Database()->fetch(sprintf("
					SELECT e.id, e.section_id, s.name, s.handle
					FROM `tbl_entries` AS `e`
					LEFT JOIN `tbl_sections` AS `s` ON (s.id = e.section_id)
					WHERE e.id IN (%s)
					",
					implode(',', $relation_id)
				));

				// 3. Group the `relation_id`'s by section_id
				$section_ids = array();
				$section_info = array();
				foreach($relation_ids as $relation_information) {
					$section_ids[$relation_information['section_id']][] = $relation_information['id'];

					if(!array_key_exists($relation_information['section_id'], $section_info)) {
						$section_info[$relation_information['section_id']] = array(
							'name' => $relation_information['name'],
							'handle' => $relation_information['handle']
						);
					}
				}

				// 4. Foreach Group, use the EntryManager to fetch the entry information
				// using the schema option to only return data for the related field
				$relation_data = array();
				foreach($section_ids as $section_id => $entry_data) {
					$schema = array();
					// Get schema
					foreach($fields as $field) {
						if($field->get('parent_section') == $section_id) {
							$schema = array($field->get('element_name'));
							break;
						}
					}

					$entries = self::$em->fetch(array_values($entry_data), $section_id, null, null, null, null, false, true, $schema);

					// 5. Loop over the Entries, passing the data to Field->prepareTableValue
					foreach($entries as $entry) {
						$relation_data[] = array(
							'id' => $entry->get('id'),
							'section_handle' => $section_info[$section_id]['handle'],
							'section_name' => $section_info[$section_id]['name'],
							'value' => $field->prepareTableValue($entry->getData($field->get('id')))
						);
					}
				}

				self::$cache[$hash]['relation_data'] = $relation_data;
			}
			else {
				$relation_data = self::$cache[$hash]['relation_data'];
			}

			// 6. Return the resulting array containing the id, section_handle, section_name and value
			return $relation_data;
		}

	/*-------------------------------------------------------------------------
		Settings:
	-------------------------------------------------------------------------*/

		public function findDefaults(&$fields){
			if(!isset($fields['allow_multiple_selection'])) $fields['allow_multiple_selection'] = 'no';
			if(!isset($fields['show_association'])) $fields['show_association'] = 'yes';
		}

		public function displaySettingsPanel(&$wrapper, $errors=NULL){
			parent::displaySettingsPanel($wrapper, $errors);

			$sectionManager = new SectionManager(Administration::instance());
			$sections = $sectionManager->fetch(NULL, 'ASC', 'sortorder');
			$options = array();

			if(is_array($sections) && !empty($sections)) foreach($sections as $section){
				$section_fields = $section->fetchFields();
				if(!is_array($section_fields)) continue;

				$fields = array();
				foreach($section_fields as $f){
					if($f->get('id') != $this->get('id') && $f->canPrePopulate()) {
						$fields[] = array(
							$f->get('id'),
							is_array($this->get('related_field_id')) ? in_array($f->get('id'), $this->get('related_field_id')) : false,
							$f->get('label')
						);
					}
				}

				if(!empty($fields)) {
					$options[] = array(
						'label' => $section->get('name'),
						'options' => $fields
					);
				}
			}

			$label = Widget::Label(__('Values'));
			$label->appendChild(
				Widget::Select('fields['.$this->get('sortorder').'][related_field_id][]', $options, array(
					'multiple' => 'multiple'
				))
			);

			// Add options
			if(isset($errors['related_field_id'])) {
				$wrapper->appendChild(Widget::wrapFormElementWithError($label, $errors['related_field_id']));
			}
			else $wrapper->appendChild($label);

			// Maximum entries
			$label = Widget::Label();
			$input = Widget::Input('fields['.$this->get('sortorder').'][limit]', $this->get('limit'));
			$input->setAttribute('size', '3');
			$label->setValue(__('Limit to the %s most recent entries', array($input->generate())));
			$wrapper->appendChild($label);

			// Allow selection of multiple items
			$label = Widget::Label();
			$input = Widget::Input('fields['.$this->get('sortorder').'][allow_multiple_selection]', 'yes', 'checkbox');
			if($this->get('allow_multiple_selection') == 'yes') $input->setAttribute('checked', 'checked');
			$label->setValue($input->generate() . ' ' . __('Allow selection of multiple options'));

			$div = new XMLElement('div', NULL, array('class' => 'compact'));
			$div->appendChild($label);
			$this->appendShowAssociationCheckbox($div);
			$this->appendRequiredCheckbox($div);
			$this->appendShowColumnCheckbox($div);
			$wrapper->appendChild($div);
		}

		public function checkFields(&$errors, $checkForDuplicates = true) {
			parent::checkFields($errors, $checkForDuplicates);

			$related_fields = $this->get('related_field_id');
			if(empty($related_fields)){
				$errors['related_field_id'] = __('This is a required field.');
			}

			return (is_array($errors) && !empty($errors) ? self::__ERROR__ : self::__OK__);
		}

		public function commit(){
			if(!parent::commit()) return false;

			$id = $this->get('id');

			if($id === false) return false;

			$fields = array();
			$fields['field_id'] = $id;
			if($this->get('related_field_id') != '') $fields['related_field_id'] = $this->get('related_field_id');
			$fields['allow_multiple_selection'] = $this->get('allow_multiple_selection') ? $this->get('allow_multiple_selection') : 'no';
			$fields['show_association'] = $this->get('show_association') == 'yes' ? 'yes' : 'no';
			$fields['limit'] = max(1, (int)$this->get('limit'));
			$fields['related_field_id'] = implode(',', $this->get('related_field_id'));

			Symphony::Database()->query("DELETE FROM `tbl_fields_".$this->handle()."` WHERE `field_id` = '$id'");

			if(!Symphony::Database()->insert($fields, 'tbl_fields_' . $this->handle())) return false;

			$this->removeSectionAssociation($id);
			foreach($this->get('related_field_id') as $field_id){
				$this->createSectionAssociation(NULL, $id, $field_id, $this->get('show_association') == 'yes' ? true : false);
			}

			return true;
		}

	/*-------------------------------------------------------------------------
		Publish:
	-------------------------------------------------------------------------*/

		public function displayPublishPanel(XMLElement &$wrapper, $data = null, $error = null, $prefix = null, $postfix = null, $entry_id = null) {
			$entry_ids = array();
			$options = array();

			if(!is_null($data['relation_id'])){
				if(!is_array($data['relation_id'])){
					$entry_ids = array($data['relation_id']);
				}
				else{
					$entry_ids = array_values($data['relation_id']);
				}
			}

			if($this->get('required') != 'yes') $options[] = array(NULL, false, NULL);

			$states = $this->findOptions($entry_ids);
			if(!empty($states)){
				foreach($states as $s){
					$group = array('label' => $s['name'], 'options' => array());
					foreach($s['values'] as $id => $v){
						$group['options'][] = array($id, in_array($id, $entry_ids), General::sanitize($v));
					}
					$options[] = $group;
				}
			}

			$fieldname = 'fields'.$prefix.'['.$this->get('element_name').']'.$postfix;
			if($this->get('allow_multiple_selection') == 'yes') $fieldname .= '[]';

			$label = Widget::Label($this->get('label'));
			$label->appendChild(
				Widget::Select($fieldname, $options, ($this->get('allow_multiple_selection') == 'yes' ? array(
					'multiple' => 'multiple') : NULL
				))
			);

			if(!is_null($error)) {
				$wrapper->appendChild(Widget::wrapFormElementWithError($label, $error));
			}
			else $wrapper->appendChild($label);
		}

		public function processRawFieldData($data, &$status, $simulate=false, $entry_id=NULL){
			$status = self::__OK__;

			if(!is_array($data)) return array('relation_id' => $data);
			if(empty($data)) return null;

			$result = array();

			foreach($data as $a => $value) {
				$result['relation_id'][] = (int)$data[$a];
			}

			return $result;
		}

		public function getExampleFormMarkup(){
			return Widget::Input('fields['.$this->get('element_name').']', '...', 'hidden');
		}

	/*-------------------------------------------------------------------------
		Output:
	-------------------------------------------------------------------------*/

		public function appendFormattedElement(&$wrapper, $data, $encode=false){
			if(!is_array($data) || empty($data) || is_null($data['relation_id'])) return;

			$list = new XMLElement($this->get('element_name'));

			if(!is_array($data['relation_id'])) {
				$data['relation_id'] = array($data['relation_id']);
			}
			$related_values = $this->findRelatedValues($data['relation_id']);

			foreach($related_values as $relation) {
				$value = $relation['value'];

				$item = new XMLElement('item');
				$item->setAttribute('id', $relation['id']);
				$item->setAttribute('handle', Lang::createHandle($relation['value']));
				$item->setAttribute('section-handle', $relation['section_handle']);
				$item->setAttribute('section-name', General::sanitize($relation['section_name']));
				$item->setValue(General::sanitize($relation['value']));

				$list->appendChild($item);
			}

			$wrapper->appendChild($list);
		}

		public function getParameterPoolValue($data){
			return $data['relation_id'];
		}

		public function prepareTableValue($data, XMLElement $link=NULL){
			$result = array();

			if(!is_array($data) || (is_array($data) && !isset($data['relation_id']))) {
				return parent::prepareTableValue(null);
			}

			if(!is_array($data['relation_id'])){
				$data['relation_id'] = array($data['relation_id']);
			}

			$result = $this->findRelatedValues($data['relation_id']);

			if(!is_null($link)){
				$label = '';
				foreach($result as $item){
					$label .= ' ' . $item['value'];
				}
				$link->setValue(General::sanitize(trim($label)));
				return $link->generate();
			}

			$output = '';

			foreach($result as $item){
				$link = Widget::Anchor($item['value'], sprintf('%s/publish/%s/edit/%d/', SYMPHONY_URL, $item['section_handle'], $item['id']));
				$output .= $link->generate() . ' ';
			}

			return trim($output);
		}

	/*-------------------------------------------------------------------------
		Filtering:
	-------------------------------------------------------------------------*/

		public function buildDSRetrivalSQL($data, &$joins, &$where, $andOperation=false){
			$field_id = $this->get('id');

			if(preg_match('/^sql:\s*/', $data[0], $matches)) {
				$data = trim(array_pop(explode(':', $data[0], 2)));

				// Check for NOT NULL (ie. Entries that have any value)
				if(strpos($data, "NOT NULL") !== false) {
					$joins .= " LEFT JOIN
									`tbl_entries_data_{$field_id}` AS `t{$field_id}`
								ON (`e`.`id` = `t{$field_id}`.entry_id)";
					$where .= " AND `t{$field_id}`.relation_id IS NOT NULL ";

				}
				// Check for NULL (ie. Entries that have no value)
				else if(strpos($data, "NULL") !== false) {
					$joins .= " LEFT JOIN
									`tbl_entries_data_{$field_id}` AS `t{$field_id}`
								ON (`e`.`id` = `t{$field_id}`.entry_id)";
					$where .= " AND `t{$field_id}`.relation_id IS NULL ";

				}
			}
			else {
				$negation = false;
				if(preg_match('/^not:/', $data[0])) {
					$data[0] = preg_replace('/^not:/', null, $data[0]);
					$negation = true;
				}

				foreach($data as $key => &$value) {
					// for now, I assume string values are the only possible handles.
					// of course, this is not entirely true, but I find it good enough.
					if(!is_numeric($value) && !is_null($value)){
						$related_field_ids = $this->get('related_field_id');
						$id = null;

						foreach($related_field_ids as $related_field_id) {
							try {
								$return = Symphony::Database()->fetchCol("id", sprintf(
									"SELECT
										`entry_id` as `id`
									FROM
										`tbl_entries_data_%d`
									WHERE
										`handle` = '%s'
									LIMIT 1", $related_field_id, Lang::createHandle($value)
								));

								// Skipping returns wrong results when doing an AND operation, return 0 instead.
								if(!empty($return)) {
									$id = $return[0];
									break;
								}
							} catch (Exception $ex) {
								// Do nothing, this would normally be the case when a handle
								// column doesn't exist!
							}
						}

						$value = (is_null($id)) ? 0 : $id;
					}
				}

				if($andOperation) {
					$condition = ($negation) ? '!=' : '=';
					foreach($data as $key => $bit){
						$joins .= " LEFT JOIN `tbl_entries_data_$field_id` AS `t$field_id$key` ON (`e`.`id` = `t$field_id$key`.entry_id) ";
						$where .= " AND `t$field_id$key`.relation_id $condition '$bit' ";
					}
				}
				else {
					$condition = ($negation) ? 'NOT IN' : 'IN';
					$joins .= " LEFT JOIN `tbl_entries_data_$field_id` AS `t$field_id` ON (`e`.`id` = `t$field_id`.entry_id) ";
					$where .= " AND `t$field_id`.relation_id $condition ('".implode("', '", $data)."') ";
				}

			}

			return true;
		}

	/*-------------------------------------------------------------------------
		Grouping:
	-------------------------------------------------------------------------*/

		public function groupRecords($records){
			if(!is_array($records) || empty($records)) return;

			$groups = array($this->get('element_name') => array());

			$related_field_id = current($this->get('related_field_id'));
			$field = self::$em->fieldManager->fetch($related_field_id);

			if(!$field instanceof Field) return;

			foreach($records as $r){
				$data = $r->getData($this->get('id'));
				$value = $data['relation_id'];

				$related_data = self::$em->fetch($value, $field->get('parent_section'), 1, null, null, null, false, true, array($field->get('element_name')));
				$related_data = current($related_data);

				if(!$related_data instanceof Entry) continue;

				$primary_field = $field->prepareTableValue($related_data->getData($related_field_id));

				if(!isset($groups[$this->get('element_name')][$value])){
					$groups[$this->get('element_name')][$value] = array(
						'attr' => array(
							'link-id' => $data['relation_id'],
							'link-handle' => Lang::createHandle($primary_field),
							'value' => General::sanitize($primary_field)),
						'records' => array(),
						'groups' => array()
					);
				}

				$groups[$this->get('element_name')][$value]['records'][] = $r;
			}

			return $groups;
		}

	}
