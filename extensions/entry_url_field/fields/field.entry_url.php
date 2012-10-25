<?php
	
	if (!defined('__IN_SYMPHONY__')) die('<h2>Symphony Error</h2><p>You cannot directly access this file</p>');
	
	class FieldEntry_URL extends Field {
		protected static $ready = true;
		
		public function __construct(&$parent) {
			parent::__construct($parent);
			
			$this->_name = 'Entry URL';
			$this->_driver = $this->_engine->ExtensionManager->create('entry_url_field');
			
			// Set defaults:
			$this->set('show_column', 'no');
			$this->set('new_window', 'no');
			$this->set('hide', 'no');
		}
		
		public function createTable() {
			$field_id = $this->get('id');
			
			return $this->_engine->Database->query("
				CREATE TABLE IF NOT EXISTS `tbl_entries_data_{$field_id}` (
					`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
					`entry_id` INT(11) UNSIGNED NOT NULL,
					`value` TEXT DEFAULT NULL,
					PRIMARY KEY (`id`),
					KEY `entry_id` (`entry_id`),
					FULLTEXT KEY `value` (`value`)
				)
			");
		}
		
	/*-------------------------------------------------------------------------
		Settings:
	-------------------------------------------------------------------------*/
		
		public function displaySettingsPanel(&$wrapper, $errors = null) {
			parent::displaySettingsPanel($wrapper, $errors);
			
			$order = $this->get('sortorder');
			
			$label = Widget::Label('Anchor Label');
			$label->appendChild(Widget::Input(
				"fields[{$order}][anchor_label]",
				$this->get('anchor_label')
			));
			$wrapper->appendChild($label);
			
			$label = Widget::Label('Anchor URL (XPath expression)');
			$label->appendChild(Widget::Input(
				"fields[{$order}][expression]",
				$this->get('expression')
			));			
			$help = new XMLElement('p', 'To access the other fields, use XPath: <code>{entry/field-one} static text {entry/field-two}</code>.');
			$help->setAttribute('class', 'help');
			$wrapper->appendChild($label);
			
			$label = Widget::Label();
			$input = Widget::Input("fields[{$order}][new_window]", 'yes', 'checkbox');
			if ($this->get('new_window') == 'yes') $input->setAttribute('checked', 'checked');
			$label->setValue($input->generate() . ' Open links in a new window');
			$wrapper->appendChild($label);
			
			$label = Widget::Label();
			$input = Widget::Input("fields[{$order}][hide]", 'yes', 'checkbox');
			if ($this->get('hide') == 'yes') $input->setAttribute('checked', 'checked');
			$label->setValue($input->generate() . ' Hide this field on publish page');
			$wrapper->appendChild($label);
			
			$this->appendShowColumnCheckbox($wrapper);
			
		}
		
		public function commit() {
			if (!parent::commit()) return false;
			
			$id = $this->get('id');
			$handle = $this->handle();
			
			if ($id === false) return false;
			
			$fields = array(
				'field_id'			=> $id,
				'anchor_label'		=> $this->get('anchor_label'),
				'expression'		=> $this->get('expression'),
				'new_window'		=> $this->get('new_window'),
				'hide'				=> $this->get('hide')
			);
			
			$this->Database->query("
				DELETE FROM
					`tbl_fields_{$handle}`
				WHERE
					`field_id` = '{$id}'
				LIMIT 1
			");
			
			return $this->Database->insert($fields, "tbl_fields_{$handle}");
		}
		
	/*-------------------------------------------------------------------------
		Publish:
	-------------------------------------------------------------------------*/
		
		public function displayPublishPanel(&$wrapper, $data = null, $flagWithError = null, $prefix = null, $postfix = null) {
			$sortorder = $this->get('sortorder');
			$element_name = $this->get('element_name');
			$allow_override = null;
			
			$label = Widget::Label($this->get('label'));
			$span = new XMLElement('span', NULL, array('class' => 'frame'));
			
			$anchor = Widget::Anchor(
				$this->get('anchor_label'),
				$data['value']
			);
			
			if ($this->get('new_window') == 'yes') {
				$anchor->setAttribute('target', '_blank');
			}
			
			$callback = Administration::instance()->getPageCallback();
			if (is_null($callback['context']['entry_id'])) {
				$span->setValue(__('The link will be created after saving this entry'));
				$span->setAttribute('class', 'inactive');
			} else {
				$span->appendChild($anchor);
			}
			
			$label->appendChild($span);
			
			if ($this->get('hide') == 'no') $wrapper->appendChild($label);
		}
		
	/*-------------------------------------------------------------------------
		Input:
	-------------------------------------------------------------------------*/
		
		public function checkPostFieldData($data, &$message, $entry_id = null) {
			$this->_driver->registerField($this);
			
			return self::__OK__;
		}
		
		public function processRawFieldData($data, &$status, $simulate = false, $entry_id = null) {
			$status = self::__OK__;
			
			return array('value' => null);
		}
		
	/*-------------------------------------------------------------------------
		Output:
	-------------------------------------------------------------------------*/
		
		public function appendFormattedElement(&$wrapper, $data, $encode = false) {
			if (!self::$ready) return;
			
			$element = new XMLElement($this->get('element_name'));
			$element->setValue(General::sanitize($data['value']));
			$wrapper->appendChild($element);
		}
		
		public function prepareTableValue($data, XMLElement $link = null) {
			if (empty($data)) return;
			
			$anchor =  Widget::Anchor($this->get('anchor_label'), $data['value']);
			if ($this->get('new_window') == 'yes') $anchor->setAttribute('target', '_blank');
			return $anchor->generate();
		}
		
	/*-------------------------------------------------------------------------
		Compile:
	-------------------------------------------------------------------------*/
		
		public function compile($entry) {
			self::$ready = false;
			
			$xpath = $this->_driver->getXPath($entry);
			
			self::$ready = true;
			
			$entry_id = $entry->get('id');
			$field_id = $this->get('id');
			$expression = $this->get('expression');
			$replacements = array();
			
			// Find queries:
			preg_match_all('/\{[^\}]+\}/', $expression, $matches);
			
			// Find replacements:
			foreach ($matches[0] as $match) {
				$results = @$xpath->query(trim($match, '{}'));
				
				if ($results->length) {
					$replacements[$match] = $results->item(0)->nodeValue;
				} else {
					$replacements[$match] = '';
				}
			}
			
			// Apply replacements:
			$value = str_replace(
				array_keys($replacements),
				array_values($replacements),
				$expression
			);
			
			// Save:
			$result = $this->Database->update(array(
				'value'				=> $value
			), "tbl_entries_data_{$field_id}", "
				`entry_id` = '{$entry_id}'
			");
		}
		
		
	}