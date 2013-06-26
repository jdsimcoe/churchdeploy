<?php
	Class extension_Conditionalizer extends Extension{
	
		public function about() {
			return array('name' => __('Conditionalizer'),
						 'version' => '1.2.2',
						 'release-date' => '2012-07-11',
						 'author' => array('name' => 'Marcin Konicki',
										   'website' => 'http://ahwayakchih.neoni.net',
										   'email' => 'ahwayakchih@neoni.net'),
						 'description' => __('Allows to execute data-sources and/or save entries conditionally.')
			);
		}

		public function uninstall() {
			return Symphony::Database()->query("DROP TABLE `tbl_fields_conditionalizer`");
		}
		
		public function update($previousVersion) {
			return true;
		}

		private function updateFilterField($previousVersion) {
			// Update 1.0 installations
			if (version_compare($previousVersion, '1.1', '<')) {
				$fields = Symphony::Database()->fetchCol('field_id', 'SELECT f.field_id FROM `tbl_fields_filter` AS f');
				if (!empty($fields)) {
					foreach ($fields as $id) {
						Symphony::Database()->query("ALTER TABLE `tbl_entries_data_{$id}` ADD `value` enum('yes','no') DEFAULT 'yes'");
					}
				}
				Symphony::Database()->query("ALTER TABLE `tbl_fields_filter` ADD `filter_publish_errors` enum('yes','no') DEFAULT 'no'");
			}
		}

		public function install() {
			$result = Symphony::Database()->query("CREATE TABLE IF NOT EXISTS `tbl_fields_conditionalizer` (
				`id` int(11) unsigned NOT NULL auto_increment,
				`field_id` int(11) unsigned NOT NULL,
				`expression` TEXT,
				`show_errors` enum('yes','no') NOT NULL default 'no',
				PRIMARY KEY  (`id`),
				UNIQUE KEY `field_id` (`field_id`)
			)");

			if (!$result) return $result;

			// Convert "filterfield".
			$previousVersion = Symphony::Database()->fetchVar('version', 0, 'SELECT e.version FROM `tbl_extensions` e WHERE `name` = "filterfield"');
			if (!empty($previousVersion)) {
				// Update first, to make sure we have everything we need.
				$this->updateFilterField($previousVersion);

				// Convert all "Filter" fields to "Conditionalizer" fields.
				$fields = Symphony::Database()->fetchCol('id', 'SELECT f.id FROM `tbl_fields` AS f WHERE `type` = "filter"');
				if (!empty($fields)) {
					if (Symphony::Database()->query('INSERT INTO `tbl_fields_conditionalizer` (`field_id`, `expression`, `show_errors`) SELECT f.field_id, f.filter_publish, f.filter_publish_errors FROM `tbl_fields_filter` f')) {
						if (!Symphony::Database()->query("UPDATE `tbl_fields` SET `type` = 'conditionalizer' WHERE `type` = 'filter'")) {
							Symphony::Database()->query('DELETE FROM `tbl_fields_conditionalizer`');
						}
					}
				}
			}

			return $result;
		}

		public function getSubscribedDelegates() {
			return array(
				array(
					'page' => '/backend/',
					'delegate' => 'AdminPagePreGenerate',
					'callback' => 'appendConditionalizer'
				),
				array(
					'page' => '/blueprints/datasources/',
					'delegate' => 'DatasourcePreCreate',
					'callback' => 'appendDataSourceConditions'
				),
				array(
					'page' => '/blueprints/datasources/',
					'delegate' => 'DatasourcePreEdit',
					'callback' => 'appendDataSourceConditions'
				),
				array(
					'page' => '/frontend/',
					'delegate' => 'DataSourcePreExecute',
					'callback' => 'conditionalize'
				),
			);
		}

		public function appendConditionalizer(&$context) {
/*
			'oPage' => &$this->Page
*/

			$callback = Symphony::Engine()->getPageCallback();
			if ($callback['driver'] != 'blueprintsdatasources' || !is_array($callback['context']) || empty($callback['context'])) return;

			// Find data source handle.
			$handle = NULL;
			if ($callback['context'][0] == 'edit' && !empty($callback['context'][1])) {
				$handle = $callback['context'][1];
			}

			// Find current Expression values.
			$data = '';
			if (isset($_POST['conditionalizer'])) {
				$data = $_POST['conditionalizer'];
			}
			else if (!empty($handle)) {
				$existing = DatasourceManager::create($handle, NULL, false);
				if (!empty($existing)) {
					if (isset($existing->dsParamConditionalizer)) {
						$data = $existing->dsParamConditionalizer;
					}
					if (!empty($existing->dsParamROOTELEMENT)) {
						$handle = $existing->dsParamROOTELEMENT;
					}
				}
			}

			$fieldset = new XMLElement('fieldset');
			$fieldset->setAttribute('class', 'settings conditionalizer');
			$fieldset->appendChild(new XMLElement('legend', __('Conditionalizer')));

			$fieldset->appendChild(new XMLElement('script', NULL, array('src' => URL . '/extensions/conditionalizer/assets/conditionalizer.js', 'type' => 'text/javascript')));

			$label = Widget::Label(__('Expression'));
			$label->appendChild(Widget::Textarea('conditionalizer', 6, 50, General::sanitize(stripslashes($data)), array('class' => 'code')));

			if (!class_exists('Conditionalizer')) {
				require_once(EXTENSIONS . '/conditionalizer/lib/class.conditionalizer.php');
			}

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

			if (empty($e) && !empty($data)) $fieldset->appendChild(Widget::Error($label, __('Invalid syntax')));
			else $fieldset->appendChild($label);

			// Add list of parameters that may be available.
			$params = Conditionalizer::listParams();
			if (!empty($params)) {
				$optionlist = new XMLElement('ul');
				$optionlist->setAttribute('class', 'tags');

				$optionlist->appendChild(new XMLElement('li', 'yes', array('title' => 'Exact string value')));
				$optionlist->appendChild(new XMLElement('li', 'no', array('title' => 'Exact string value')));

				foreach ($params as $param => $value) {
					$optionlist->appendChild(new XMLElement('li', $param, array('class' => '{'.$param.'}', 'title' => ($value ? __('Value of %s returned from another data source', array($value)) : __('Value found in URL path')))));
				}

				$fieldset->appendChild($optionlist);
			}

			$nodes = $context['oPage']->Form->getChildren();
			for ($i = count($nodes) - 1; $i >= 0; $i--) {
				if ($nodes[$i]->getName() == 'div' && preg_match('/(^|\s)actions(\s|$)/i', $nodes[$i]->getAttribute('class'))) {
					$context['oPage']->Form->insertChildAt($i, $fieldset);
					break;
				}
			}
		}

		public function appendDataSourceConditions(&$context) {
/*
						'file' => $file,
						'contents' => &$dsShell,
						'params' => $params,
						'elements' => $elements,
						'filters' => $filters,
						'dependencies' => $dependencies
*/
			if (!isset($_POST['conditionalizer']) || empty($_POST['conditionalizer'])) return;

			$data = var_export($_POST['conditionalizer'], true).";\n";

			// Store condition in data-source
			$context['contents'] = preg_replace('/public \$dsParamROOTELEMENT [^\n]+\n/', '$0		public \$dsParamConditionalizer = '.$data, $context['contents']);

			// Update dependencies
			// From content.blueprintsdatasources.php
			if (preg_match_all('@(\$ds-[-_0-9a-z]+)@i', $data, $matches)) {
				if (!is_array($context['dependencies'])) $context['dependencies'] = array();
				$context['dependencies'] = General::array_remove_duplicates(array_merge($matches[1], $context['dependencies']));
				$context['contents'] = preg_replace('/'.preg_quote('$this->_dependencies = array(').'[^\)]*\);/', '$this->_dependencies = array(\''.implode("', '", $context['dependencies']).'\');', $context['contents']);
			}
		}

		public function conditionalize(&$context) {
/*
						'datasource' => $ds,
						'xml' => &$xml,
						'param_pool' => &$this->_env['pool']
*/
			if (empty($context) || !isset($context['datasource'])
				|| !isset($context['datasource']->dsParamConditionalizer)
				|| empty($context['datasource']->dsParamConditionalizer)
			) return;

			if (!class_exists('Conditionalizer')) {
				require_once(EXTENSIONS . '/conditionalizer/lib/class.conditionalizer.php');
			}

			$data = $context['datasource']->__processParametersInString($context['datasource']->dsParamConditionalizer, array('env' => Frontend::Page()->Env(), 'param' => Frontend::Page()->Params()));
			$e = Conditionalizer::parse($data);
			if (!empty($e) && !Conditionalizer::evaluate($e)) {
				$context['xml'] = new XMLElement($context['datasource']->dsParamROOTELEMENT, '<error>'.__('Condition not met.').'</error>');
			}
		}
	}

