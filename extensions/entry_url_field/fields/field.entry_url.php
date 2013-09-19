<?php
	
	if (!defined('__IN_SYMPHONY__')) die('<h2>Symphony Error</h2><p>You cannot directly access this file</p>');
	
	class FieldEntry_URL extends Field {
		protected static $ready = true;
		
		public function __construct() {
			parent::__construct();
			
			$this->_name = 'Entry URL';
			$this->_driver = ExtensionManager::create('entry_url_field');
			
			// Set defaults:
			$this->set('show_column', 'no');
			$this->set('new_window', 'no');
			$this->set('hide', 'no');
		}
		
		public function createTable() {
			$field_id = $this->get('id');
			
			return Symphony::Database()->query("
				CREATE TABLE IF NOT EXISTS `tbl_entries_data_{$field_id}` (
					`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
					`entry_id` INT(11) UNSIGNED NOT NULL,
					`label` TEXT DEFAULT NULL,
					`value` TEXT DEFAULT NULL,
					PRIMARY KEY (`id`),
					KEY `entry_id` (`entry_id`)
				)
			");
		}
		
	/*-------------------------------------------------------------------------
		Settings:
	-------------------------------------------------------------------------*/
		
		public function displaySettingsPanel(&$wrapper, $errors = null) {
			parent::displaySettingsPanel($wrapper, $errors);
			
			$order = $this->get('sortorder');
			
			$label = Widget::Label(__('Anchor Label'));
			$label->appendChild(Widget::Input(
				"fields[{$order}][anchor_label]",
				$this->get('anchor_label')
			));
			$wrapper->appendChild($label);
			
			$label = Widget::Label(__('Anchor URL (XPath expression)'));
			$label->appendChild(Widget::Input(
				"fields[{$order}][expression]",
				$this->get('expression')
			));			
			$help = new XMLElement('p', __('To access the other fields, use XPath: <code>{entry/field-one} static text {entry/field-two}</code>.'));
			$help->setAttribute('class', 'help');
			$wrapper->appendChild($label);
			
			$label = Widget::Label();
			$input = Widget::Input("fields[{$order}][new_window]", 'yes', 'checkbox');
			if ($this->get('new_window') == 'yes') $input->setAttribute('checked', 'checked');
			$label->setValue($input->generate() . ' ' . __('Open links in a new window'));
			$wrapper->appendChild($label);
			
			$label = Widget::Label();
			$input = Widget::Input("fields[{$order}][hide]", 'yes', 'checkbox');
			if ($this->get('hide') == 'yes') $input->setAttribute('checked', 'checked');
			$label->setValue($input->generate() . ' ' . __('Hide this field on publish page'));
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
			
			Symphony::Database()->query("DELETE FROM `tbl_fields_{$handle}` WHERE `field_id` = '{$id}' LIMIT 1");
			return Symphony::Database()->insert($fields, "tbl_fields_{$handle}");
		}
		
	/*-------------------------------------------------------------------------
		Publish:
	-------------------------------------------------------------------------*/
		
		public function displayPublishPanel(&$wrapper, $data = null, $flagWithError = null, $prefix = null, $postfix = null) {
			$label = Widget::Label($this->get('label'));
			$span = new XMLElement('span', null, array('class' => 'frame'));
			
			$anchor = Widget::Anchor(
				(string)$data['label'],
				is_null($data['value']) ? '#' : $this->formatURL((string)$data['value'])
			);
			
			if ($this->get('new_window') == 'yes') {
				$anchor->setAttribute('target', '_blank');
			}
			
			$callback = Administration::instance()->getPageCallback();
			if (is_null($callback['context']['entry_id'])) {
				$span->setValue(__('The link will be created after saving this entry'));
				$span->setAttribute('class', 'frame inactive');
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
			
			return array('label' => null, 'value' => null);
		}
		
	/*-------------------------------------------------------------------------
		Output:
	-------------------------------------------------------------------------*/
		
		public function appendFormattedElement(&$wrapper, $data, $encode = false) {
			if (!self::$ready) return;
			
			$element = new XMLElement($this->get('element_name'));
			$element->setAttribute('label', General::sanitize($data['label']));
			$element->setValue(General::sanitize($data['value']));
			$wrapper->appendChild($element);
		}
		
		public function prepareTableValue($data, XMLElement $link = null) {
			if (empty($data)) return;
			
			$anchor =  Widget::Anchor($data['label'], $this->formatURL($data['value']));
			if ($this->get('new_window') == 'yes') $anchor->setAttribute('target', '_blank');
			return $anchor->generate();
		}
		
		public function formatURL($url) {
			// ignore if an absolute URL
			if(preg_match("/^http/", $url)) return $url;
			// deal with Sym in subdirectories
			return URL . $url;
		}
		
	/*-------------------------------------------------------------------------
		Compile:
	-------------------------------------------------------------------------*/
		
		public function compile($entry) {
			self::$ready = false;
			
			$xpath = $this->_driver->getXPath($entry);
			
			self::$ready = true;
			
			$value = $this->getExpression($xpath, 'expression');
			$label = $this->getExpression($xpath, 'anchor_label');

			// Save:
			Symphony::Database()->update(
				array(
					'label' => $label,
					'value' => $value
				),
				sprintf("tbl_entries_data_%s", $this->get('id')),
				sprintf("`entry_id` = '%s'", $entry->get('id'))
			);
		}


		private function getExpression($xpath, $handle){
			$expression = $this->get($handle);
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

			return $value;
		}
		
	}
