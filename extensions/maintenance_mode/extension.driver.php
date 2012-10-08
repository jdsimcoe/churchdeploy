<?php

	Class extension_maintenance_mode extends Extension {

		public function about() {
			return array(
				'name' => 'Maintenance Mode',
				'version' => '1.5',
				'release-date' => '2011-08-08',
				'author' => array(
					array(
						'name' => 'Alistair Kearney',
						'website' => 'http://pointybeard.com',
						'email' => 'alistair@pointybeard.com'
					),
					array(
						'name' => 'Symphony Team',
						'website' => 'http://symphony-cms.com',
						'email' => 'team@symphony-cms.com'
					)
				)
			);
		}

		public function install() {
			Symphony::Configuration()->set('enabled', 'no', 'maintenance_mode');
			Administration::instance()->saveConfig();
		}

		public function uninstall() {
			Symphony::Configuration()->remove('maintenance_mode');
		}

		public function getSubscribedDelegates(){
			return array(
				array(
					'page' => '/system/preferences/',
					'delegate' => 'AddCustomPreferenceFieldsets',
					'callback' => 'appendPreferences'
				),
				array(
					'page' => '/system/preferences/',
					'delegate' => 'Save',
					'callback' => '__SavePreferences'
				),
				array(
					'page' => '/system/preferences/',
					'delegate' => 'CustomActions',
					'callback' => '__toggleMaintenanceMode'
				),
				array(
					'page' => '/backend/',
					'delegate' => 'AppendPageAlert',
					'callback' => '__appendAlert'
				),
				array(
					'page' => '/blueprints/pages/',
					'delegate' => 'AppendPageContent',
					'callback' => '__appendType'
				),
				array(
					'page' => '/frontend/',
					'delegate' => 'FrontendPrePageResolve',
					'callback' => '__checkForMaintenanceMode'
				),
				array(
					'page' => '/frontend/',
					'delegate' => 'FrontendParamsResolve',
					'callback' => '__addParam'
				)
			);
		}

		/**
		 * Append maintenance mode preferences
		 *
		 * @param array $context
		 *  delegate context
		 */
		public function appendPreferences($context) {

			// Create preference group
			$group = new XMLElement('fieldset');
			$group->setAttribute('class', 'settings');
			$group->appendChild(new XMLElement('legend', __('Maintenance Mode')));

			// Append settings
			$label = Widget::Label();
			$input = Widget::Input('settings[maintenance_mode][enabled]', 'yes', 'checkbox');
			if(Symphony::Configuration()->get('enabled', 'maintenance_mode') == 'yes') $input->setAttribute('checked', 'checked');
			$label->setValue($input->generate() . ' ' . __('Enable maintenance mode'));
			$group->appendChild($label);

			// Append help
			$group->appendChild(new XMLElement('p', __('Maintenance mode will redirect all visitors, other than developers, to the specified maintenance page. To specify a maintenance page, give a page a type of <code>maintenance</code>'), array('class' => 'help')));

			// Append new preference group
			$context['wrapper']->appendChild($group);
		}

		/**
		 * Save preferences
		 *
		 * @param array $context
		 *  delegate context
		 */
		public function __SavePreferences($context) {

			// Disable maintenance mode by default
			if(!is_array($context['settings'])) {
				$context['settings'] = array('maintenance_mode' => array('enabled' => 'no'));
			}

			// Disable maintenance mode if it has not been set to 'yes'
			elseif(!isset($context['settings']['maintenance_mode'])) {
				$context['settings']['maintenance_mode'] = array('enabled' => 'no');
			}
		}

		/**
		 * Toggle maintenance mode and redirect to the previous page, if specified.
		 */
		public function __toggleMaintenanceMode() {
			if($_REQUEST['action'] == 'toggle-maintenance-mode') {

				// Toogle mode
				$value = (Symphony::Configuration()->get('enabled', 'maintenance_mode') == 'no' ? 'yes' : 'no');
				Symphony::Configuration()->set('enabled', $value, 'maintenance_mode');
				Administration::instance()->saveConfig();

				// Redirect
				redirect((isset($_REQUEST['redirect']) ? SYMPHONY_URL . $_REQUEST['redirect'] : Administration::instance()->getCurrentPageURL() . '/'));
			}
		}

		/**
		 * Append notice that the site is currently in maintenance mode offering a link
		 * to switch to live mode if no other alert is set.
		 *
		 * @param array $context
		 *  delegate context
		 */
		public function __appendAlert($context) {

			// Check for other alerts
			if(!is_null($context['alert'])) return;

			// Site in maintenance mode
			if(Symphony::Configuration()->get('enabled', 'maintenance_mode') == 'yes') {
				Administration::instance()->Page->pageAlert(
					__('This site is currently in maintenance mode.') . ' <a href="' . SYMPHONY_URL . '/system/preferences/?action=toggle-maintenance-mode&amp;redirect=' . getCurrentPage() . '">' . __('Restore?') . '</a>',
					Alert::NOTICE
				);
			}
		}

		/**
		 * Append type for maintenance pages to page editor.
		 *
		 * @param array $context
		 *  delegate context
		 */
		public function __appendType($context) {

			// Find page types
			$elements = $context['form']->getChildren();
			$fieldset = $elements[0]->getChildren();
			$group = $fieldset[2]->getChildren();
			$div = $group[1]->getChildren();
			$types = $div[2]->getChildren();

			// Search for existing maintenance type
			$flag = false;
			foreach($types as $type) {
				if($type->getValue() == 'maintenance') {
					$flag = true;
				}
			}

			// Append maintenance type
			if($flag == false) {
				$mode = new XMLElement('li', 'maintenance');
				$div[2]->appendChild($mode);
			}
		}

		/**
		 * Redirect to maintenance page, if site is in maintenance and the user is not logged in
		 *
		 * @param array $context
		 *  delegate context
		 */
		public function __checkForMaintenanceMode($context) {
			if(!Symphony::Engine()->isLoggedIn() && Symphony::Configuration()->get('enabled', 'maintenance_mode') == 'yes'){

				// Find custom maintenance page
				$context['row'] = Symphony::Database()->fetchRow(0,
					"SELECT `tbl_pages`.* FROM `tbl_pages`, `tbl_pages_types`
					 WHERE `tbl_pages_types`.page_id = `tbl_pages`.id
					 AND tbl_pages_types.`type` = 'maintenance'
					 LIMIT 1"
				);

				// Default maintenance message
				if(empty($context['row'])) {
					Symphony::Engine()->customError(
						__('Website Offline'),
						__('This site is currently in maintenance. Please check back at a later date.')
					);
				}
			}
		}

		/**
		 * Add site mode to parameter pool
		 *
		 * @param array $context
		 *  delegate context
		 */
		public function __addParam($context) {
			$context['params']['site-mode'] = (Symphony::Configuration()->get('enabled', 'maintenance_mode') == 'yes' ? 'maintenance' : 'live');
		}

	}
