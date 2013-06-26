<?php

	/**
	 * @package textboxfield
	 */

	if (!defined('__IN_SYMPHONY__')) die('<h2>Symphony Error</h2><p>You cannot directly access this file</p>');

	require_once TOOLKIT . '/class.xsltprocess.php';
	require_once EXTENSIONS . '/textboxfield/extension.driver.php';
	require_once FACE . '/interface.exportablefield.php';
	require_once FACE . '/interface.importablefield.php';

	/**
	 * An enhanced text input field.
	 */
	class FieldTextBox extends Field implements ExportableField, ImportableField {
	/*-------------------------------------------------------------------------
		Definition:
	-------------------------------------------------------------------------*/

		public function __construct() {
			parent::__construct();

			$this->_name = 'Text Box';
			$this->_required = true;

			// Set defaults:
			$this->set('show_column', 'yes');
			$this->set('required', 'yes');
		}

		public function createTable() {
			$field_id = $this->get('id');

			return Symphony::Database()->query("
				CREATE TABLE IF NOT EXISTS `tbl_entries_data_{$field_id}` (
					`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
					`entry_id` INT(11) UNSIGNED NOT NULL,
					`handle` VARCHAR(255) DEFAULT NULL,
					`value` TEXT DEFAULT NULL,
					`value_formatted` TEXT DEFAULT NULL,
					`word_count` INT(11) UNSIGNED DEFAULT NULL,
					PRIMARY KEY (`id`),
					KEY `entry_id` (`entry_id`),
					KEY `handle` (`handle`),
					FULLTEXT KEY `value` (`value`),
					FULLTEXT KEY `value_formatted` (`value_formatted`)
				) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
			");
		}

		public function allowDatasourceOutputGrouping() {
			return true;
		}

		public function allowDatasourceParamOutput() {
			return true;
		}

		public function canFilter() {
			return true;
		}

		public function canPrePopulate() {
			return true;
		}

		public function isSortable() {
			return true;
		}

	/*-------------------------------------------------------------------------
		Utilities:
	-------------------------------------------------------------------------*/

		public function createHandle($value, $entry_id) {
			$handle = Lang::createHandle(strip_tags(html_entity_decode($value)));

			if ($this->isHandleLocked($handle, $entry_id)) {
				if ($this->isHandleFresh($handle, $value, $entry_id)) {
					return $this->getCurrentHandle($entry_id);
				}

				else {
					$count = 2;

					while ($this->isHandleLocked("{$handle}-{$count}", $entry_id)) $count++;

					return "{$handle}-{$count}";
				}
			}

			return $handle;
		}

		public function getCurrentHandle($entry_id) {
			return Symphony::Database()->fetchVar('handle', 0, sprintf(
				"
					SELECT
						f.handle
					FROM
						`tbl_entries_data_%s` AS f
					WHERE
						f.entry_id = '%s'
					LIMIT 1
				",
				$this->get('id'), $entry_id
			));
		}

		public function isHandleLocked($handle, $entry_id) {
			return (boolean)Symphony::Database()->fetchVar('id', 0, sprintf(
				"
					SELECT
						f.id
					FROM
						`tbl_entries_data_%s` AS f
					WHERE
						f.handle = '%s'
						%s
					LIMIT 1
				",
				$this->get('id'), $handle,
				(!is_null($entry_id) ? "AND f.entry_id != '{$entry_id}'" : '')
			));
		}

		public function isHandleFresh($handle, $value, $entry_id) {
			return (boolean)Symphony::Database()->fetchVar('id', 0, sprintf(
				"
					SELECT
						f.id
					FROM
						`tbl_entries_data_%s` AS f
					WHERE
						f.entry_id = '%s'
						AND f.value = '%s'
						AND f.handle = '%s'
					LIMIT 1
				",
				$this->get('id'), $entry_id,
				$this->cleanValue(General::sanitize($value)),
				$this->cleanValue(General::sanitize($handle))
			));
		}

		protected function repairEntities($value) {
			return preg_replace('/&(?!(#[0-9]+|#x[0-9a-f]+|amp|lt|gt);)/i', '&amp;', trim($value));
		}

	/*-------------------------------------------------------------------------
		Settings:
	-------------------------------------------------------------------------*/

		public function findDefaults(array &$settings) {
			$settings['column_length'] = 75;
			$settings['text_size'] = 'medium';
			$settings['text_length'] = 0;
			$settings['text_handle'] = 'yes';
			$settings['text_cdata'] = 'no';
		}

		public function displaySettingsPanel(XMLElement &$wrapper, $errors = null) {
			parent::displaySettingsPanel($wrapper, $errors);

			$order = $this->get('sortorder');

		/*---------------------------------------------------------------------
			Expression
		---------------------------------------------------------------------*/

			$columns = new XMLElement('div');
			$columns->setAttribute('class', 'two columns');

			$values = array(
				array('single', false, __('Single Line')),
				array('small', false, __('Small Box')),
				array('medium', false, __('Medium Box')),
				array('large', false, __('Large Box')),
				array('huge', false, __('Huge Box'))
			);

			foreach ($values as &$value) {
				$value[1] = $value[0] == $this->get('text_size');
			}

			$label = Widget::Label('Size');
			$label->setAttribute('class', 'column');
			$label->appendChild(Widget::Select(
				"fields[{$order}][text_size]", $values
			));

			$columns->appendChild($label);

		/*---------------------------------------------------------------------
			Text Formatter
		---------------------------------------------------------------------*/

			$columns->appendChild($this->buildFormatterSelect(
				$this->get('text_formatter'),
				"fields[{$order}][text_formatter]",
				__('Text Formatter')
			));

			$wrapper->appendChild($columns);
		/*---------------------------------------------------------------------
			Validator
		---------------------------------------------------------------------*/

			$div = new XMLElement('div');
			$this->buildValidationSelect(
				$div, $this->get('text_validator'), "fields[{$order}][text_validator]"
			);
			$wrapper->appendChild($div);

		/*---------------------------------------------------------------------
			Limiting
		---------------------------------------------------------------------*/

			$columns = new XMLElement('div');
			$columns->setAttribute('class', 'two columns');

			$input = Widget::Input(
				"fields[{$order}][text_length]",
				(string)(integer)$this->get('text_length')
			);
			$input->setAttribute('size', '3');

			$label = Widget::Label(
				__('Limit input to %s characters', array(
					$input->generate()
				))
			);
			$label->setAttribute('class', 'column');

			$columns->appendChild($label);

		/*---------------------------------------------------------------------
			Show characters
		---------------------------------------------------------------------*/

			$input = Widget::Input(
				"fields[{$order}][column_length]",
				(string)(integer)$this->get('column_length')
			);
			$input->setAttribute('size', '3');

			$label = Widget::Label(
				__('Show %s characters in preview', array(
					$input->generate()
				))
			);

			$label->setAttribute('class', 'column');

			$columns->appendChild($label);
			$wrapper->appendChild($columns);

		/*---------------------------------------------------------------------
			Options
		---------------------------------------------------------------------*/

			$columns = new XMLElement('div');
			$columns->setAttribute('class', 'two columns');

			$input = Widget::Input(
				"fields[{$order}][text_handle]",
				'no', 'hidden'
			);
			$columns->appendChild($input);

			$input = Widget::Input(
				"fields[{$order}][text_handle]",
				'yes', 'checkbox'
			);

			if ($this->get('text_handle') == 'yes') {
				$input->setAttribute('checked', 'checked');
			}

			$label = Widget::Label(
				__('%s Output with handles', array(
					$input->generate()
				))
			);
			$label->setAttribute('class', 'column');
			$columns->appendChild($label);

			$input = Widget::Input(
				"fields[{$order}][text_cdata]",
				'no', 'hidden'
			);
			$columns->appendChild($input);

			$input = Widget::Input(
				"fields[{$order}][text_cdata]",
				'yes', 'checkbox'
			);

			if ($this->get('text_cdata') == 'yes') {
				$input->setAttribute('checked', 'checked');
			}

			$label = Widget::Label(
				__('%s Output as CDATA', array(
					$input->generate()
				))
			);
			$label->setAttribute('class', 'column');
			$columns->appendChild($label);

			$wrapper->appendChild($columns);

		/*---------------------------------------------------------------------
			Core options
		---------------------------------------------------------------------*/

			$columns = new XMLElement('div');
			$columns->setAttribute('class','two columns');
			$this->appendRequiredCheckbox($columns);
			$this->appendShowColumnCheckbox($columns);
			$wrapper->appendChild($columns);
		}

		public function commit() {
			if (!parent::commit()) return false;

			$id = $this->get('id');

			if ($id === false) return false;

			$fields = array(
				'field_id'			=> $id,
				'column_length'		=> max((integer)$this->get('column_length'), 25),
				'text_size'			=> $this->get('text_size'),
				'text_formatter'	=> $this->get('text_formatter'),
				'text_validator'	=> $this->get('text_validator'),
				'text_length'		=> max((integer)$this->get('text_length'), 0),
				'text_cdata'		=> $this->get('text_cdata'),
				'text_handle'		=> $this->get('text_handle')
			);

			return FieldManager::saveSettings($id, $fields);
		}

	/*-------------------------------------------------------------------------
		Publish:
	-------------------------------------------------------------------------*/

		public function displayPublishPanel(XMLElement &$wrapper, $data = null, $flagWithError = null, $fieldnamePrefix = null, $fieldnamePostfix = null, $entry_id = null) {
			Extension_TextBoxField::appendHeaders(
				Extension_TextBoxField::PUBLISH_HEADERS
			);

			$sortorder = $this->get('sortorder');
			$element_name = $this->get('element_name');
			$classes = array();

			$label = Widget::Label($this->get('label'));
			$optional = '';

			if ($this->get('required') != 'yes') {
				if ((integer)$this->get('text_length') > 0) {
					$optional = __('$1 of $2 remaining') . ' &ndash; ' . __('Optional');
				}

				else {
					$optional = __('Optional');
				}
			}

			else if ((integer)$this->get('text_length') > 0) {
				$optional = __('$1 of $2 remaining');
			}

			if ($optional) {
				$label->appendChild(new XMLElement('i', $optional));
			}

			// Input box:
			if ($this->get('text_size') == 'single') {
				$input = Widget::Input(
					"fields{$fieldnamePrefix}[$element_name]{$fieldnamePostfix}", General::sanitize($data['value'])
				);

				###
				# Delegate: ModifyTextBoxInlineFieldPublishWidget
				# Description: Allows developers modify the textbox before it is rendered in the publish forms
				$delegate = 'ModifyTextBoxInlineFieldPublishWidget';
			}

			// Text Box:
			else {
				$input = Widget::Textarea(
					"fields{$fieldnamePrefix}[$element_name]{$fieldnamePostfix}", 20, 50, General::sanitize($data['value'])
				);

				###
				# Delegate: ModifyTextBoxFullFieldPublishWidget
				# Description: Allows developers modify the textbox before it is rendered in the publish forms
				$delegate = 'ModifyTextBoxFullFieldPublishWidget';
			}

			// Add classes:
			$classes[] = 'size-' . $this->get('text_size');

			if ($this->get('text_formatter') != 'none') {
				$classes[] = $this->get('text_formatter');
			}

			$input->setAttribute('class', implode(' ', $classes));
			$input->setAttribute('length', (integer)$this->get('text_length'));

			Symphony::ExtensionManager()->notifyMembers(
				$delegate, '/backend/',
				array(
					'field'		=> $this,
					'label'		=> $label,
					'input'		=> $input,
					'textarea'	=> $input
				)
			);

			if (is_null($label)) return;

			$label->appendChild($input);

			if ($flagWithError != null) {
				$label = Widget::Error($label, $flagWithError);
			}

			$wrapper->appendChild($label);
		}

	/*-------------------------------------------------------------------------
		Input:
	-------------------------------------------------------------------------*/

		public function applyFormatting($data) {
			if ($this->get('text_formatter') != 'none') {
				$formatter = TextformatterManager::create($this->get('text_formatter'));
				$formatted = $formatter->run($data);
				$formatted = preg_replace('/&(?![a-z]{0,4}\w{2,3};|#[x0-9a-f]{2,6};)/i', '&amp;', $formatted);

				return $formatted;
			}

			return General::sanitize($data);
		}

		public function applyValidationRules($data) {
			$rule = $this->get('text_validator');

			return ($rule ? General::validateString($data, $rule) : true);
		}

		public function checkPostFieldData($data, &$message, $entry_id = null) {
			$length = (integer)$this->get('text_length');
			$message = null;

			if ($this->get('required') == 'yes' and strlen(trim($data)) == 0) {
				$message = __(
					"'%s' is a required field.", array(
						$this->get('label')
					)
				);

				return self::__MISSING_FIELDS__;
			}

			if (empty($data)) self::__OK__;

			if (!$this->applyValidationRules($data)) {
				$message = __(
					"'%s' contains invalid data. Please check the contents.", array(
						$this->get('label')
					)
				);

				return self::__INVALID_FIELDS__;
			}

			// get data length
			$length_data = function_exists('mb_strlen')
				// use mb function for better utf8-support where possible
				? mb_strlen($data, 'utf-8')
				// fallback for shitty server configurations
				: strlen($data);

			// check data length
			if ($length > 0 and $length < $length_data) {
				$message = __(
					"'%s' must be no longer than %s characters.", array(
						$this->get('label'),
						$length
					)
				);

				return self::__INVALID_FIELDS__;
			}

			if (!General::validateXML($this->applyFormatting($data), $errors, false, new XsltProcess)) {
				$message = __(
					"'%1\$s' contains invalid XML. The following error was returned: <code>%2\$s</code>", array(
						$this->get('label'),
						$errors[0]['message']
					)
				);

				return self::__INVALID_FIELDS__;
			}

			return self::__OK__;
		}

		public function processRawFieldData($data, &$status, &$message = null, $simulate = false, $entry_id = null) {
			$status = self::__OK__;
			$formatted = $this->applyFormatting($data);

			$result = array(
				'handle'			=> $this->createHandle($formatted, $entry_id),
				'value'				=> (string)$data,
				'value_formatted'	=> $formatted,
				'word_count'		=> General::countWords($data)
			);

			return $result;
		}

	/*-------------------------------------------------------------------------
		Output:
	-------------------------------------------------------------------------*/

		public function fetchIncludableElements() {
			return array(
				$this->get('element_name') . ': formatted',
				$this->get('element_name') . ': unformatted'
			);
		}

		public function appendFormattedElement(XMLElement &$wrapper, $data, $encode = false, $mode = null, $entry_id = null) {
			if(is_null($data['value'])) return;

			if ($mode == 'unformatted') {
				$value = trim($data['value']);
			}

			else {
				$mode = 'formatted';
				$value = trim($data['value_formatted']);
			}

			if ($mode == 'unformatted' or $this->get('text_cdata') == 'yes') {
				$value = '<![CDATA[' . $value . ']]>';
			}

			// TODO: Remove this for 2.1 release.
			else if ($encode) {
				$value = General::sanitize($value);
			}

			else {
				$value = $this->repairEntities($value);
			}

			$attributes = array(
				'mode'			=> $mode,
				'handle'		=> $data['handle'],
				'word-count'	=> $data['word_count']
			);

			if ($this->get('text_handle') != 'yes') {
				unset($attributes['handle']);
			}

			$wrapper->appendChild(new XMLElement(
				$this->get('element_name'), $value, $attributes
			));
		}

		public function prepareTableValue($data, XMLElement $link = null, $entry_id = null) {
			if (empty($data) or strlen(trim($data['value'])) == 0) $data['value'] = __('None');

			$max_length = (integer)$this->get('column_length');
			$max_length = ($max_length ? $max_length : 75);

			$value = strip_tags(
				isset($data['value_formatted'])
					? $data['value_formatted']
					: $data['value']
			);

			if ($max_length < strlen($value)) {
				$lines = explode("\n", wordwrap($value, $max_length - 1, "\n"));
				$value = array_shift($lines);
				$value = rtrim($value, "\n\t !?.,:;");
				$value .= '...';
			}

			if ($max_length > 75) {
				$value = wordwrap($value, 75, '<br />');
			}

			if ($link) {
				$link->setValue($value);

				return $link->generate();
			}

			return $value;
		}

		public function getParameterPoolValue(array $data, $entry_id=NULL){
			if ($this->get('text_handle') != 'yes') {
				return $data['value'];
			}

			return $data['handle'];
		}

	/*-------------------------------------------------------------------------
		Import:
	-------------------------------------------------------------------------*/

		public function getImportModes() {
			return array(
				'getValue' =>		ImportableField::STRING_VALUE,
				'getPostdata' =>	ImportableField::ARRAY_VALUE
			);
		}

		public function prepareImportValue($data, $mode, $entry_id = null) {
			$message = $status = null;
			$modes = (object)$this->getImportModes();

			if($mode === $modes->getValue) {
				return $data;
			}
			else if($mode === $modes->getPostdata) {
				return $this->processRawFieldData($data, $status, $message, true, $entry_id);
			}

			return null;
		}

	/*-------------------------------------------------------------------------
		Export:
	-------------------------------------------------------------------------*/

		/**
		 * Return a list of supported export modes for use with `prepareExportValue`.
		 *
		 * @return array
		 */
		public function getExportModes() {
			return array(
				'getHandle' =>		ExportableField::HANDLE,
				'getFormatted' =>	ExportableField::FORMATTED,
				'getUnformatted' =>	ExportableField::UNFORMATTED,
				'getPostdata' =>	ExportableField::POSTDATA
			);
		}

		/**
		 * Give the field some data and ask it to return a value using one of many
		 * possible modes.
		 *
		 * @param mixed $data
		 * @param integer $mode
		 * @param integer $entry_id
		 * @return string|null
		 */
		public function prepareExportValue($data, $mode, $entry_id = null) {
			$modes = (object)$this->getExportModes();

			// Export handles:
			if ($mode === $modes->getHandle) {
				if (isset($data['handle'])) {
					return $data['handle'];
				}

				else if (isset($data['value'])) {
					return General::createHandle($data['value']);
				}
			}

			// Export unformatted:
			else if ($mode === $modes->getUnformatted || $mode === $modes->getPostdata) {
				return isset($data['value'])
					? $data['value']
					: null;
			}

			// Export formatted:
			else if ($mode === $modes->getFormatted) {
				if (isset($data['value_formatted'])) {
					return $data['value_formatted'];
				}

				else if (isset($data['value'])) {
					return General::sanitize($data['value']);
				}
			}

			return null;
		}

	/*-------------------------------------------------------------------------
		Filtering:
	-------------------------------------------------------------------------*/

		public function displayDatasourceFilterPanel(XMLElement &$wrapper, $data = null, $errors = null, $fieldnamePrefix = null, $fieldnamePostfix = null) {
			Extension_TextBoxField::appendHeaders(
				Extension_TextBoxField::FILTER_HEADERS
			);
			$field_id = $this->get('id');

			parent::displayDatasourceFilterPanel($wrapper, $data, $errors, $fieldnamePrefix, $fieldnamePostfix);
			$wrapper->setAttribute('class', $wrapper->getAttribute('class') . ' field-textbox');

			$filters = array(
				array(
					'name'				=> 'boolean',
					'filter'			=> 'boolean:',
					'help'				=> __('Find values that match the given query. Can use operators <code>and</code> and <code>not</code>.')
				),
				array(
					'name'				=> 'not-boolean',
					'filter'			=> 'not-boolean:',
					'help'				=> __('Find values that do not match the given query. Can use operators <code>and</code> and <code>not</code>.')
				),

				array(
					'name'				=> 'regexp',
					'filter'			=> 'regexp:',
					'help'				=> __('Find values that match the given <a href="%s">MySQL regular expressions</a>.', array(
						'http://dev.mysql.com/doc/mysql/en/Regexp.html'
					))
				),
				array(
					'name'				=> 'not-regexp',
					'filter'			=> 'not-regexp:',
					'help'				=> __('Find values that do not match the given <a href="%s">MySQL regular expressions</a>.', array(
						'http://dev.mysql.com/doc/mysql/en/Regexp.html'
					))
				),

				array(
					'name'				=> 'contains',
					'filter'			=> 'contains:',
					'help'				=> __('Find values that contain the given string.')
				),
				array(
					'name'				=> 'not-contains',
					'filter'			=> 'not-contains:',
					'help'				=> __('Find values that do not contain the given string.')
				),

				array(
					'name'				=> 'starts-with',
					'filter'			=> 'starts-with:',
					'help'				=> __('Find values that start with the given string.')
				),
				array(
					'name'				=> 'not-starts-with',
					'filter'			=> 'not-starts-with:',
					'help'				=> __('Find values that do not start with the given string.')
				),

				array(
					'name'				=> 'ends-with',
					'filter'			=> 'ends-with:',
					'help'				=> __('Find values that end with the given string.')
				),
				array(
					'name'				=> 'not-ends-with',
					'filter'			=> 'not-ends-with:',
					'help'				=> __('Find values that do not end with the given string.')
				)
			);

			$list = new XMLElement('ul');

			foreach ($filters as $value) {
				$item = new XMLElement('li', $value['name']);
				$item->setAttribute('title', $value['filter']);
				$item->setAttribute('alt', General::sanitize($value['help']));
				$list->appendChild($item);
			}

			$help = new XMLElement('p');
			$help->setAttribute('class', 'help');
			$help->setValue(__('Find values that are an exact match for the given string.'));

			$wrapper->appendChild($list);
			$wrapper->appendChild($help);
		}

		public function buildDSRetrievalSQL($data, &$joins, &$where, $andOperation = false) {
			$field_id = $this->get('id');

			if (self::isFilterRegex($data[0])) {
				$this->buildRegexSQL($data[0], array('value', 'handle'), $joins, $where);
			}

			else if (preg_match('/^(not-)?boolean:\s*/', $data[0], $matches)) {
				$data = trim(array_pop(explode(':', implode(' + ', $data), 2)));
				$negate = ($matches[1] == '' ? '' : 'NOT');

				if ($data == '') return true;

				// Negative match?
				if (preg_match('/^not(\W)/i', $data)) {
					$mode = '-';

				} else {
					$mode = '+';
				}

				// Replace ' and ' with ' +':
				$data = preg_replace('/(\W)and(\W)/i', '\\1+\\2', $data);
				$data = preg_replace('/(^)and(\W)|(\W)and($)/i', '\\2\\3', $data);
				$data = preg_replace('/(\W)not(\W)/i', '\\1-\\2', $data);
				$data = preg_replace('/(^)not(\W)|(\W)not($)/i', '\\2\\3', $data);
				$data = preg_replace('/([\+\-])\s*/', '\\1', $mode . $data);

				$data = $this->cleanValue($data);
				$this->_key++;
				$joins .= "
					LEFT JOIN
						`tbl_entries_data_{$field_id}` AS t{$field_id}_{$this->_key}
						ON (e.id = t{$field_id}_{$this->_key}.entry_id)
				";
				$where .= "
					AND {$negate}(MATCH (t{$field_id}_{$this->_key}.value) AGAINST ('{$data}' IN BOOLEAN MODE))
				";
			}

			else if (preg_match('/^(not-)?((starts|ends)-with|contains):\s*/', $data[0], $matches)) {
				$data = trim(array_pop(explode(':', $data[0], 2)));
				$negate = ($matches[1] == '' ? '' : 'NOT');
				$data = $this->cleanValue($data);

				if ($matches[2] == 'ends-with') $data = "%{$data}";
				if ($matches[2] == 'starts-with') $data = "{$data}%";
				if ($matches[2] == 'contains') $data = "%{$data}%";

				$this->_key++;
				$joins .= "
					LEFT JOIN
						`tbl_entries_data_{$field_id}` AS t{$field_id}_{$this->_key}
						ON (e.id = t{$field_id}_{$this->_key}.entry_id)
				";
				$where .= "
					AND {$negate}(
						t{$field_id}_{$this->_key}.handle LIKE '{$data}'
						OR t{$field_id}_{$this->_key}.value LIKE '{$data}'
					)
				";
			}

			else if ($andOperation) {
				foreach ($data as $value) {
					$this->_key++;
					$value = $this->cleanValue($value);
					$joins .= "
						LEFT JOIN
							`tbl_entries_data_{$field_id}` AS t{$field_id}_{$this->_key}
							ON (e.id = t{$field_id}_{$this->_key}.entry_id)
					";
					$where .= "
						AND (
							t{$field_id}_{$this->_key}.handle = '{$value}'
							OR t{$field_id}_{$this->_key}.value = '{$value}'
						)
					";
				}
			}

			else {
				if (!is_array($data)) $data = array($data);

				foreach ($data as &$value) {
					$value = $this->cleanValue($value);
				}

				$this->_key++;
				$data = implode("', '", $data);
				$joins .= "
					LEFT JOIN
						`tbl_entries_data_{$field_id}` AS t{$field_id}_{$this->_key}
						ON (e.id = t{$field_id}_{$this->_key}.entry_id)
				";
				$where .= "
					AND (
						t{$field_id}_{$this->_key}.handle IN ('{$data}')
						OR t{$field_id}_{$this->_key}.value IN ('{$data}')
					)
				";
			}

			return true;
		}

	/*-------------------------------------------------------------------------
		Sorting:
	-------------------------------------------------------------------------*/

		public function buildSortingSQL(&$joins, &$where, &$sort, $order = 'ASC') {
			if (in_array(strtolower($order), array('random', 'rand'))) {
				$sort = 'ORDER BY RAND()';
			}

			else {
				$sort = sprintf('
					ORDER BY (
						SELECT %s
						FROM tbl_entries_data_%d AS `ed`
						WHERE entry_id = e.id
					) %s',
					'`ed`.handle',
					$this->get('id'),
					$order
				);
			}
		}

	/*-------------------------------------------------------------------------
		Grouping:
	-------------------------------------------------------------------------*/

		public function groupRecords($records) {
			if (!is_array($records) or empty($records)) return;

			$groups = array(
				$this->get('element_name') => array()
			);

			foreach ($records as $record) {
				$data = $record->getData($this->get('id'));

				$value = $data['value_formatted'];
				$handle = $data['handle'];
				$element = $this->get('element_name');

				if (!isset($groups[$element][$value])) {
					$groups[$element][$value] = array(
						'attr'		=> array(
							'handle'	=> $handle, //output only the first unique handle found
							'value'		=> $value	//ouput the value used to group entry
						),
						'records'	=> array(),
						'groups'	=> array()
					);
				}

				$groups[$element][$value]['records'][] = $record;
			}

			return $groups;
		}
	}
