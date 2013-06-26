<?php

	require_once(EXTENSIONS . '/conditionalizer/lib/class.conditionalizer.php');

	Class fieldConditionalizer extends Field {

		// We cache XML and values at checkPostFieldData() and clear it after processRawFieldData().
		// That way all Conditionalizer fields for the same entry can use the same XML
		// (no need to regenerate whole thing for each Conditionalizer field in the section).
		// WARNING: this trick will be broken if something will call checkPostFieldData() for different entries,
		//          and call processRawFieldData() only after that. As far as i know nothing does such thing (yet?).
		static $xpath;
		static $results;

		static $recursion;
		static $processed;

		public function __construct() {
			parent::__construct();

			$this->_name = __('Conditionalizer');
			$this->_required = false;
			$this->_showcolumn = false;

			// Set defaults
			$this->set('show_column', 'no');
			$this->set('hide', 'yes');
			$this->set('required', 'yes');
		}

	/*-------------------------------------------------------------------------
		Definition:
	-------------------------------------------------------------------------*/

		public function canFilter() {
			return true;
		}

		public function isSortable() {
			return true;
		}

	/*-------------------------------------------------------------------------
		Setup:
	-------------------------------------------------------------------------*/

		public function createTable() {
			return Symphony::Database()->query(
				'CREATE TABLE IF NOT EXISTS `tbl_entries_data_'.$this->get('id').'` (
					`id` int(11) unsigned NOT NULL auto_increment,
					`entry_id` int(11) unsigned NOT NULL,
					`value` enum(\'yes\',\'no\') DEFAULT \'yes\',
					PRIMARY KEY (`id`),
					KEY `entry_id` (`entry_id`)
				) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;'
			);
		}

	/*-------------------------------------------------------------------------
		Settings:
	-------------------------------------------------------------------------*/

		public function findDefaults(array &$settings) {
			if (!isset($settings['expression'])) $settings['expression'] = '';
			if (!isset($settings['show_errors'])) $settings['show_errors'] = 'no';
		}

		public function displaySettingsPanel(XMLElement &$wrapper, $errors = NULL) {
			parent::displaySettingsPanel($wrapper, $errors);

			// Disable/Enable publish filtering
			$label = Widget::Label(__('Expression'));
			$label->appendChild(new XMLElement('i', __('Optional')));
			$input = Widget::Textarea('fields['.$this->get('sortorder').'][expression]', 6, 50, General::sanitize(stripslashes($this->get('expression'))), array('class' => 'code'));
			$label->appendChild($input);
			if (isset($errors['expression'])) $wrapper->appendChild(Widget::wrapFormElementWithError($label, $errors['expression']));
			else $wrapper->appendChild($label);
			$wrapper->appendChild(new XMLElement('p', __('Default value of this field will be set to <code>yes</code>. If expression above will evaluate to <code>false</code>, value of this field will be set to <code>no</code>. Use <code>{XPath}</code> syntax to put values into expression before it will be evaluated, e.g., to make use of a value posted from HTML element called "<code>fields[published]</code>" enter "<code>{/data/post/published}</code>".'), array('class' => 'help')));

			// Disable/Enable publish error when evaluated expression returns false
			$label = Widget::Label();
			$input = Widget::Input('fields['.$this->get('sortorder').'][show_errors]', 'yes', 'checkbox');
			if ($this->get('show_errors') == 'yes') $input->setAttribute('checked', 'checked');
			$label->setValue(__('%s Show error when expression entered above evaluates to <code>false</code>', array($input->generate())));
			$wrapper->appendChild($label);
		}

		public function checkFields(Array &$errors, $checkForDuplicates = true) {

			$expression = trim($this->get('expression'));
			if (!empty($expression)) {
				$r = Conditionalizer::parse($expression);
				if (empty($r)) $errors['expression'] = __('Invalid syntax');
			}

			return parent::checkFields($errors, $checkForDuplicates);
		}

		public function commit() {
			if (!parent::commit()) return false;

			$id = $this->get('id');

			if ($id === false) return false;

			$fields = array();
			$fields['field_id'] = $id;
			$fields['expression'] = trim($this->get('expression'));
			$fields['show_errors'] = ($this->get('show_errors') == 'yes' ? 'yes' : 'no');

			return FieldManager::saveSettings($id, $fields);
		}

	/*-------------------------------------------------------------------------
		Publish:
	-------------------------------------------------------------------------*/

		public function displayPublishPanel(XMLElement &$wrapper, $data = NULL, $flagWithError = NULL, $fieldnamePrefix = NULL, $fieldnamePostfix = NULL, $entry_id = NULL) {
			if ($flagWithError == NULL) return;

			$label = Widget::Label($this->get('label'));
			$wrapper->appendChild(Widget::wrapFormElementWithError($label, $flagWithError));
		}

		public function checkPostFieldData($data, &$message, $entry_id = NULL) {
			if (!($expression = trim($this->get('expression'))) || self::$recursion == true) return self::__OK__;

			// Clear XPath cache if processRawFieldData() was run
			// (which means all fields were checked and processed, and now new checks are run for new entry)
			if (self::$processed == true) {
				self::$xpath = NULL;
				self::$results = array();
				self::$processed = false;
			}

			// Preprocess expression
			if (preg_match_all('@{([^}]+)}@i', $expression, $matches, PREG_SET_ORDER)) {
				$xpath = $this->getXPath($entry_id);
				foreach ($matches as $m) {
					$v = @$xpath->evaluate("string({$m[1]})");
					if (is_null($v)) {
						$expression = str_replace($m[0], '', $expression);
					}
					else {
						$expression = str_replace($m[0], $v, $expression);
					}
				}
			}

			// Evaluate expression and return error if it returns false
			$result = self::__OK__;
			$message = NULL;
			if (!Conditionalizer::evaluate($expression)) {
				$message = __("Conditions not met.");
				$result = self::__INVALID_FIELDS__;
			}

			self::$results[$this->get('id')] = $result;
			if ($this->get('show_errors') == 'yes') return $result;

			return self::__OK__;		
		}

		public function processRawFieldData($data, &$status, &$message = null, $simulate = false, $entry_id = null) {
			if ($simulate != true) self::$processed = true;
			$status = self::__OK__;
			return array('value' => (self::$results[$this->get('id')] == self::__INVALID_FIELDS__ ? 'no' : 'yes'));
		}

	/*-------------------------------------------------------------------------
		Output:
	-------------------------------------------------------------------------*/

		public function appendFormattedElement(XMLElement &$wrapper, $data, $encode = false, $mode = null, $entry_id = null) {
			$value = ($data['value'] == 'yes' ? 'Yes' : 'No');
			$wrapper->appendChild(new XMLElement($this->get('element_name'), ($encode ? General::sanitize($value) : $value)));
		}

		public function prepareTableValue($data, XMLElement $link = NULL, $entry_id = null) {
			return (empty($data['value']) || $data['value'] == 'yes' ? __('Yes') : __('No'));
		}

	/*-------------------------------------------------------------------------
		Filtering:
	-------------------------------------------------------------------------*/

		public function displayDatasourceFilterPanel(&$wrapper, $data = NULL, $errors = NULL, $fieldnamePrefix = NULL, $fieldnamePostfix = NULL) {
			if ($data == NULL) $data = '(if value of (param_or_value_here) is (param_or_value_here))';

			$e = Conditionalizer::parse($data);
			if (empty($e)) {
				// Strip all parameters just to see if there was invalid expression there or none at all
				$e = preg_replace(array('@{(([^}:]+)|[^}]+?:([^}:]+))?}@i', '@{\$[^}]+}@i', '@{([^}\$]+)}@i'), array('{$2$3}', 'yes', '$1'), $data);
				$e = array_map('trim', preg_split('/(?<!\\\\)[,\+] /', $e, -1, PREG_SPLIT_NO_EMPTY));
				if (!empty($e)) {
					$e = array_diff($e, array('yes', 'no'));
					// Make array non-empty if all values are either 'yes' or 'no', otherwise make it empty to mark wrong syntax
					$e = (count($e) > 0 ? array() : array('ok'));
				}
			}

			// Copy content generated by parent::displayDatasourceFilterPanel(), so we can wrap it with error if needed
			$wrapper->appendChild(new XMLElement('header', '<h4>' . $this->get('label') . '</h4> <span>' . $this->name() . '</span>', array(
				'data-name' => $this->get('label') . ' (' . $this->name() . ')'
			)));
			$label = Widget::Label(__('Value'));
			$label->appendChild(Widget::Input('fields[filter]'.($fieldnamePrefix ? '['.$fieldnamePrefix.']' : '').'['.$this->get('id').']'.($fieldnamePostfix ? '['.$fieldnamePostfix.']' : ''), ($data ? General::sanitize($data) : null)));
			$wrapper->appendChild((empty($e) ? Widget::wrapFormElementWithError($label, __('Invalid syntax')) : $label));

			$params = Conditionalizer::listParams();
			if (empty($params)) return;

			$optionlist = new XMLElement('ul');
			$optionlist->setAttribute('class', 'tags');

			$optionlist->appendChild(new XMLElement('li', 'yes', array('title' => 'Exact string value')));
			$optionlist->appendChild(new XMLElement('li', 'no', array('title' => 'Exact string value')));

			foreach ($params as $param => $value) {
				$optionlist->appendChild(new XMLElement('li', $param, array('class' => '{'.$param.'}', 'title' => ($value ? __('Value of %s returned from another data source', array($value)) : __('Value found in URL path')))));
			}

			$wrapper->appendChild($optionlist);
		}

		public function buildDSRetrievalSQL($data, &$joins, &$where, $andOperation = false) {
			$isArray = is_array($data);

			// If filter contains expression, return result of its evaluation
			if (preg_match('/^\(if\s/i', ($isArray ? $data[0] : $data))) {
				// Glue $data back if it was split by data source
				if ($isArray) $data = implode(($andOperation ? '+ ' : ', '), $data);

				// Block data source if there was a valid expression and it did not evaluate to true
				$e = Conditionalizer::parse($data);
				if (!empty($e) && !Conditionalizer::evaluate($e)) {
					return false;
				}

				// If expression evaluated to true, remove it from data and see if we need to filter entries by our field value
				if (!empty($e)) {
					$data = ltrim(str_replace($e[0], '', $data), ($andOperation ? '+ ': ', '));
				}

				// Return true if there is nothing left in $data
				if (empty($data)) return true;

				// Split $data back to array
				$data = preg_split('/'.($andOperation ? '\+' : '(?<!\\\\),').'\s*/', $data, -1, PREG_SPLIT_NO_EMPTY);
				$data = array_map('trim', $data);

				// Block data source if not all values are either 'yes' or 'no'
				// If there were wrong parameter values, or invalid expression, this will make data souce blocked "by default"
				$e = array_diff($data, array('yes', 'no'));
				if (!empty($e)) return false;
			}

			// Filtering by expression was disabled, so perform regular filtering by "yes" and/or "no"
			$field_id = $this->get('id');
			if ($isArray) $data = array($data);
			if ($andOperation) {
				foreach ($data as $value) {
					$this->_key++;
					$or = ($value == 'yes' ? " OR t{$field_id}_{$this->_key}.value IS NULL " : '');
					$value = $this->cleanValue($value);
					$joins .= " LEFT JOIN `tbl_entries_data_{$field_id}` AS t{$field_id}_{$this->_key} ON (e.id = t{$field_id}_{$this->_key}.entry_id) ";
					$where .= " AND (t{$field_id}_{$this->_key}.value = '{$value}'{$or}) ";
				}
			} else {
				$this->_key++;
				$or = (in_array('yes', $data) ? " OR t{$field_id}_{$this->_key}.value IS NULL " : '');
				$data = implode("', '", array_map(array($this, 'cleanValue'), $data));
				$joins .= " LEFT JOIN `tbl_entries_data_{$field_id}` AS t{$field_id}_{$this->_key} ON (e.id = t{$field_id}_{$this->_key}.entry_id) ";
				$where .= " AND (t{$field_id}_{$this->_key}.value IN ('{$data}'){$or}) ";
			}

			return true;
		}

	/*-------------------------------------------------------------------------
		Events:
	-------------------------------------------------------------------------*/

		public function getExampleFormMarkup() {
			return new XMLElement('!--', ' --');
		}

	/*-------------------------------------------------------------------------
		Utilities:
	-------------------------------------------------------------------------*/

		// From Reflection field extension:
		// http://symphony-cms.com/download/extensions/view/20737/
		// https://github.com/rowan-lewis/reflectionfield
		// We split getXPath() function into appendEntryXML() and getXPath()
		private function appendEntryXML(&$wrapper, $entry) {
			$section_id = $entry->get('section_id');
			$data = $entry->getData();
			$fields = array();

			$wrapper->setAttribute('id', $entry->get('id'));

			$associated = $entry->fetchAllAssociatedEntryCounts();

			if (is_array($associated) and !empty($associated)) {
				foreach ($associated as $section => $count) {
					$handle = Symphony::Database()->fetchVar('handle', 0, "
						SELECT
							s.handle
						FROM
							`tbl_sections` AS s
						WHERE
							s.id = '{$section}'
						LIMIT 1
					");

					$wrapper->setAttribute($handle, (string)$count);
				}
			}

			// Add fields:
			foreach ($data as $field_id => $values) {
				if (empty($field_id)) continue;

				$field = FieldManager::fetch($field_id);
				$field->appendFormattedElement($wrapper, $values, false, null);
			}
		}

		private function getXML($position = 0, $entry_id = NULL) {
			// Cache stuff that can be reused between filter fields and entries
			static $post;
			static $postValues;

			// Remember if $post contains multiple entries or not
			static $expectMultiple;

			$xml = new XMLElement('data');

			// Get post values
			if (empty($postValues) || $position > 0) {
				// TODO: handle post of multiple entries at the same time
				if (empty($post)) {
					$post = General::getPostData();
					// Check if post contains multiple entries or not
					// TODO: make some hidden field required for post, so we can check for sure
					//       if $post['fields'][0]['conditionalizer'] exists?
					$expectMultiple = (is_array($post['fields']) && is_array($post['fields'][0]) ? true : false);
				}
				if (!empty($post['fields']) && is_array($post['fields'])) {
					$postValues = new XMLElement('post');
					if ($expectMultiple == true) {
						if (!empty($entry_id) && isset($post['id'])) {
							// $entry_id overrides $position
							foreach ($post['id'] as $pos => $id) {
								if ($id == $entry_id) {
									$position = $pos;
									break;
								}
							}
						}
						else if (isset($post['id'][$position]) && is_numeric($post['id'][$position])) {
							$entry_id = $post['id'][$position];
						}
						$postValues->setAttribute('position', $position);
						General::array_to_xml($postValues, $post['fields'][$position], false);
					}
					else if ($position < 1) {
						if (empty($entry_id) && isset($post['id']) && is_numeric($post['id']))
							$entry_id = $post['id'];
						General::array_to_xml($postValues, $post['fields'], false);
					}
					else {
						// TODO: add error element?
					}
				}
			}
			if (!empty($postValues)) $xml->appendChild($postValues);

			// Get old entry
			$entry = NULL;
			if (!class_exists('EntryManager')) {
				include_once(TOOLKIT . '/class.entrymanager.php');
			}

			if (!empty($entry_id)) {
				$entry = EntryManager::fetch($entry_id);
				$entry = $entry[0];
				if (is_object($entry)) {
					$entry_xml = new XMLElement('old-entry');
					$entry_xml->setAttribute('position', $position);
					$this->appendEntryXML($entry_xml, $entry);
					$xml->appendChild($entry_xml);
				}
				else $entry = NULL;
			}
			else {
				$entry = EntryManager::create();
				$entry->set('section_id', $this->get('parent_section'));
			}

			// Set new entry data. Code found in event.section.php:
			// https://github.com/symphonycms/symphony-2/blob/29244318e4de294df780513ee027edda767dd75a/symphony/lib/toolkit/events/event.section.php#L99
			if (is_object($entry)) {
				self::$recursion = true;
				if (__ENTRY_FIELD_ERROR__ == $entry->checkPostData(($expectMultiple ? $post['fields'][$position] : $post['fields']), $errors, ($entry->get('id') ? true : false))) {
					// Return early - other fields will mark their errors
					self::$recursion = false;
					return self::__OK__;
				}
				// Third argument (simulate) is set to true - no data will be changed in database
				else if (__ENTRY_OK__ != $entry->setDataFromPost(($expectMultiple ? $post['fields'][$position] : $post['fields']), $errors, true, ($entry->get('id') ? true : false))) {
					// Return early - other fields will mark their errors.
					self::$recursion = false;
					return self::__OK__;
				}
				self::$recursion = false;
				$entry_xml = new XMLElement('entry');
				$entry_xml->setAttribute('position', $position);
				$this->appendEntryXML($entry_xml, $entry);
				$xml->appendChild($entry_xml);
			}

			// Get author
			if (($temp = Symphony::Engine()->Author)) {
				$author = new XMLElement('author');
				$author->setAttribute('id', $temp->get('id'));
				$author->setAttribute('user_type', $temp->get('user_type'));
				$author->setAttribute('primary', $temp->get('primary'));
				$author->setAttribute('username', $temp->get('username'));
				$author->setAttribute('first_name', $temp->get('first_name'));
				$author->setAttribute('last_name', $temp->get('last_name'));
				$xml->appendChild($author);
			}

			return $xml;
		}

		private function getXPath($entry_id = NULL) {
			if (!empty(self::$xpath)) return self::$xpath;

			// Support posts with multiple entries
			// Whenever self::$xpath is empty, it means we're starting next entry
			static $position;
			if (empty($position) && $position !== 0) $position = 0;
			else $position++;

			$xml = $this->getXML($position, $entry_id);

			$dom = new DOMDocument();
			$dom->strictErrorChecking = false;
			$dom->loadXML($xml->generate(true));

			self::$xpath = new DOMXPath($dom);

			if (version_compare(phpversion(), '5.3', '>=')) {
				self::$xpath->registerPhpFunctions();
			}

			return self::$xpath;
		}

	}

