<?php
	
	class extension_configuration extends Extension {
		public function about() {
			return array(
				'name'	=> 'Configuration Settings',
				'type'	=> 'interface',
				'version'	=> '1.3.5',
				'release-date'	=> '2011-11-05',
				'author'		=> array(
					'name'			=> 'Stephen Bau',
					'website'		=> 'http://www.domain7.com/',
					'email'			=> 'stephen@domain7.com'
				),
				'description'	=> 'Admin interface for Symphony System Preferences',
				'compatibility' => array(
					'2.2' => true
				)
	 		);
		}
		
		public function fetchNavigation(){ 
			return array(
				array(
					'location'	=> 200,
					'name'		=> __('Configuration'),
					'link'		=> '/settings/edit/',
					'limit'		=> 'developer'
				)
			);
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
				)
			);
		}

		public function __SavePreferences(){
			$settings = $_POST['settings'];

			$setting_group = 'general';
			$setting_name = 'sitename';
			$setting_value = $settings['general']['sitename'];

			Symphony::Configuration()->set($setting_name, $setting_value, $setting_group);
			Administration::instance()->saveConfig();

		}
		
		public function appendPreferences($context){
			$group = new XMLElement('fieldset');
			$group->setAttribute('class', 'settings');
			$group->appendChild(new XMLElement('legend', __('Site Name')));			

			$sitename = Symphony::Configuration()->get('sitename', 'general');
			$label = new XMLElement('label', __('Website Name'));			
			$label->appendChild(Widget::Input('settings[general][sitename]', htmlspecialchars($sitename), 'text'));
			
			$group->appendChild($label);						
			$context['wrapper']->appendChild($group);

		}
	}
	
?>