<?php

	require_once(TOOLKIT . '/class.datasource.php');

	class Extension_GlobalParamLoader extends Extension {
	/*-------------------------------------------------------------------------
		Definition:
	-------------------------------------------------------------------------*/

		public static $params = array();

		public function about() {
			return array(
				'name'			=> 'Global Parameter Loader',
				'version'		=> '1.3',
				'release-date'	=> '2011-10-31',
				'author'		=> array(
					array(
						'name'			=> 'Carsten de Vries',
						'website'		=> 'http://www.vrieswerk.nl',
						'email'			=> 'carsten@vrieswerk.nl'
					),
					array(
						'name'			=> 'Brendan Abbott',
						'email'			=> 'brendan@bloodbone.ws'
					)
					),
				'description'	=> 'Allows you to add parameters, PHP evaluated or not, to Symphony\'s parameter pool.'
	 		);
		}

		public function uninstall() {
			Symphony::Configuration()->remove('globalparamloader');
			Administration::instance()->saveConfig();
			Symphony::Database()->query("DROP TABLE `tbl_gpl_sets`");
			Symphony::Database()->query("DROP TABLE `tbl_gpl_params`");
		}

		public function install() {
			Symphony::Database()->query("
				CREATE TABLE IF NOT EXISTS `tbl_gpl_sets` (
					`id` int(11) unsigned NOT NULL auto_increment,
					`name` varchar(255) NOT NULL,
					`params` int(11) unsigned,
					`exclude_page` varchar(255),
					PRIMARY KEY (`id`),
					INDEX `name` (`name`)
				)
			");

			Symphony::Database()->query("
				CREATE TABLE IF NOT EXISTS `tbl_gpl_params` (
					`id` int(11) NOT NULL auto_increment,
					`set_id` int(11) NOT NULL,
					`param` varchar(255) NOT NULL,
					`value` varchar(255),
					`type` varchar(255) NOT NULL,
					`sortorder` int(11) NOT NULL,
					PRIMARY KEY (`id`),
					INDEX `param` (`param`),
					INDEX `value` (`value`)
				)
			");

			return true;
		}

		public function getSubscribedDelegates() {
			return array(
				array(
					'page'		=> '/frontend/',
					'delegate'	=> 'FrontendParamsResolve',
					'callback'	=> 'addParam'
				),
				array(
					'page'		=> '/system/preferences/',
					'delegate'	=> 'AddCustomPreferenceFieldsets',
					'callback'	=> 'appendPreferences'
				)
			);
		}

		public function fetchNavigation() {
			return array(
				array(
					'location'	=> 200,
					'name'	=> __('Global Parameters'),
					'link'	=> '/sets/'
				)
			);
		}

		public function addParam(&$context) {
			$sets = $this->getSets();

			foreach ($sets as $set) {
				if(!$this->isPageSelected($context['params']['current-page-id'], $set['id'])) {
					$parameters = $this->getParameters($set['id']);
					foreach ($parameters as $parameter) {
						/*
							To do: add safe evaluation functionality.
							If the parameter can be evaluated, it is. Otherwise, the parameter is
							added to the context without evaluation.
						*/
						if(Extension_GlobalParamLoader::getEvalSetting() == 'yes') {
							$context['params'][$parameter['param']] = eval($parameter['value']) !== FALSE ? eval($parameter['value']) : $parameter['value'];
						}
						else {
							$context['params'][$parameter['param']] = $parameter['value'];
						}
					}
				}
			}
		}

		public static function getEvalSetting() {
			return Symphony::Configuration()->get('allow-eval', 'globalparameterloader');
		}

		public function appendPreferences($context) {
			// Create preference group
			$group = new XMLElement('fieldset');
			$group->setAttribute('class', 'settings');
			$group->appendChild(new XMLElement('legend', __('Global Parameter Loader')));

			// Append settings
			$label = Widget::Label();
			$input = Widget::Input('settings[globalparameterloader][allow-eval]', 'yes', 'checkbox');
			if(Extension_GlobalParamLoader::getEvalSetting() == 'yes') $input->setAttribute('checked', 'checked');
			$label->setValue($input->generate() . ' ' . __('Allow parameters to be evaluated with <code>eval</code>?'));
			$group->appendChild($label);

			// Append help
			$group->appendChild(new XMLElement('p',__('On some environments, <code>eval</code> can cause strange 500 errors. Turning off <code>eval</code> will prevent you from using PHP expressions in your parameters.'), array('class' => 'help')));

			// Append new preference group
			$context['wrapper']->appendChild($group);
		}

	/*-------------------------------------------------------------------------
		Utility functions:
	-------------------------------------------------------------------------*/

		public function getParameters($set_id = null) {
			if (is_numeric($set_id)) {
				return Symphony::Database()->fetch("
					SELECT
						c.*
					FROM
						`tbl_gpl_params` AS c
					WHERE
						c.set_id = {$set_id}
					ORDER BY
						c.sortorder ASC
				");

			} else {
				return Symphony::Database()->fetch("
					SELECT
						c.*
					FROM
						`tbl_gpl_params` AS c
					ORDER BY
						c.sortorder ASC
				");
			}
		}

		public function getPages() {
			$pages = Symphony::Database()->fetch("
				SELECT
					p.path, p.handle, p.id
				FROM
					`tbl_pages` AS p
				ORDER BY
					`sortorder` ASC
			");
			$result = array();

			foreach ($pages as $page) {
				$page = (object)$page;
				$path = '';

				if ($page->path) {
					$path = '/' . $page->path;
				}

				$path .= '/' . $page->handle;

				$result[] = (object)array(
					'id'	=> $page->id,
					'path'	=> $path
				);
			}

			sort($result);

			return $result;
		}

		public function getSets() {
			return Symphony::Database()->fetch("
				SELECT
					s.*
				FROM
					`tbl_gpl_sets` AS s
				ORDER BY
					s.name ASC
			");
		}

		public function getSet($set_id) {
			return Symphony::Database()->fetchRow(0, "
				SELECT
					s.*
				FROM
					`tbl_gpl_sets` AS s
				WHERE
					s.id = '{$set_id}'
				LIMIT 1
			");
		}

		public function getParamPages($set_id) {
			$set = $this->getSet($set_id);

			return explode(',', $set['exclude_page']);
		}

		public function isPageSelected($id, $set_id) {
			$pages = $this->getParamPages($set_id);

			return in_array($id, $pages);
		}
	}
?>
