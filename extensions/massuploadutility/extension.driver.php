<?php

	require_once(TOOLKIT . '/class.sectionmanager.php');

	class Extension_MassUploadUtility extends Extension {
	/*-------------------------------------------------------------------------
		Definition:
	-------------------------------------------------------------------------*/
		
		public function about() {
			return array(
				'name'			=> 'Mass Upload Utility',
				'version'		=> '0.9.8',
				'release-date'	=> '2011-05-31',
				'author'		=> array(
					'name'			=> 'Scott Tesoriere',
					'website'		=> 'http://tesoriere.com',
					'email'			=> 'scott@tesoriere.com'
				),
				'description'	=> 'Allows you to jam lots of Files (that already exist or you upload) into a section. The section must have an upload Field.'
	 		);
		}
		
		public function uninstall() {
			Symphony::Configuration()->remove('massuploadutility');
			Administration::instance()->saveConfig();
		}
		
		public function install() {
		}
		
		public function getSubscribedDelegates() {
			return array(
				array(
					'page' => '/system/preferences/',
					'delegate' => 'AddCustomPreferenceFieldsets',
					'callback' => 'appendPreferences'
				),
				array(
					'page' => '/system/preferences/',
					'delegate' => 'CustomActions',
					'callback' => 'savePreferences'
				),
		      	array(
	       	 		'page'    => '/backend/',
		        	'delegate' => 'AdminPagePreGenerate',
		        	'callback' => 'initaliseAdminPageHead'
	      		),
				array(
					'page'		=> '/publish/new/',
					'delegate'	=> 'EntryPostCreate',
					'callback'	=> 'returnJSON'
				),	
			);
		}

		


		// this only reaches here if an entry is created successfully, so we can avoid a redirect
		public function returnJSON($context) {
			if (isset($_REQUEST['MUUsource']) && isset($_POST['action']) && $_POST['action']['muu'] == true) {
				$response['status'] = 'success';
				echo(json_encode($response));
				exit;
			}
			
		}
		
		public function initaliseAdminPageHead($context) {
			$page = $context['parent']->Page;
			$assets_path = '/extensions/massuploadutility/assets/';
			
			// to check if it's an excluded section
			$sectionManager = new SectionManager(Administration::instance());
			$section_id = $sectionManager->fetchIDFromHandle($page->_context['section_handle']);
			
			if ($page instanceof contentPublish and $page->_context['page'] == 'new' and 
				$this->validateSection($section_id) and $this->validateUser()) {   
					   
				$page->addStylesheetToHead(URL . $assets_path . 'massuploadutility.css', 'screen', 14145);
				$page->addScriptToHead(URL . $assets_path . 'massuploadutility.publish.js',14156);
				$page->addScriptToHead(URL . $assets_path . 'jquery.html5_upload.js',14156);
			}
		}	

		
		
		/**
		 * I absolutely stole this next bit! Thank you craig zheng (craig@symphony-cms.com) :)
		 * 	via the Tracker extension
		 */
		public function appendPreferences($context){
			
			include_once(TOOLKIT . '/class.authormanager.php');
			include_once(TOOLKIT . '/class.sectionmanager.php');
		
			// Fieldset and layout
			$group = new XMLElement('fieldset');
			$group->setAttribute('class', 'settings');
			$group->appendChild(new XMLElement('legend', __('Mass Upload Utility')));

			$div = new XMLElement('div');
			$div->setAttribute('class', 'group double');
			


			// Excluded Sections
			$label = Widget::Label(__('Excluded Sections'));
			$options = array();
	
			$sm = new SectionManager(Administration::instance());

			$sections = $sm->fetch();
			$excluded_sections = explode(',', Symphony::Configuration()->get('excluded-sections', 'massuploadutility'));

			if(!empty($sections) && is_array($sections)){
				foreach($sections as $section) {
					$selected = (in_array($section->get('id'), $excluded_sections) ? TRUE : FALSE);
					$options[] = array(
						$section->get('id'),
						$selected,
						$section->get('name')
					);
				}
			}

			$input = Widget::Select(
				'settings[massuploadutility][excluded-sections][]',
				$options,
				array('multiple' => 'multiple')
			);

			$label->appendChild($input);
			$div->appendChild($label);
			
			// Excluded Users
			$label = Widget::Label(__('Excluded Users'));
			$options = array();
			
			$am = new AuthorManager(Administration::instance());
			$authors = $am->fetch();
			$excluded_authors = explode(',',Symphony::Configuration()->get('excluded-users', 'massuploadutility'));

			if(!empty($authors) && is_array($authors)){
				foreach($authors as $author) {
					$selected = (in_array($author->get('id'), $excluded_authors) ? TRUE : FALSE);
					$options[] = array(
						$author->get('id'),
						$selected,
						$author->getFullName()
					);
				}
			}

			$input = Widget::Select(
				'settings[massuploadutility][excluded-users][]',
				$options,
				array('multiple' => 'multiple')
			);

			$label->appendChild($input);
			$div->appendChild($label);

			$group->appendChild($div);
			$context['wrapper']->appendChild($group);
		}
		
		public function savePreferences() {
		
			/**
			 * Remove existing configuration settings.
			 */
			Symphony::Configuration()->remove('massuploadutility');
			Administration::instance()->saveConfig();
			
			/**
			 * If there are MassUploadUtility settings, format them
			 */
			if(is_array($_POST['settings']['massuploadutility'])){
				foreach($_POST['settings']['massuploadutility'] as $preference => $value){
					if(is_array($value)){
						$_POST['settings']['massuploadutility'][$preference] = implode(',',$value);
					}
				}
			}
		}
		
		public function getExclusions($type) {
			return explode(',', Symphony::Configuration()->get('excluded-' . $type, 'massuploadutility'));
		}
		
		public function validateSection($id) {
			if(in_array($id, $this->getExclusions('sections'))) {
				return FALSE;
			}
			else {
				return TRUE;
			}
		}	
		
		public function validateUser($id = NULL) {
			if(is_null($id)) {
				$id = Symphony::Engine()->Author->get('id');
			}
			if(in_array($id, $this->getExclusions('users'))) {
				return FALSE;
			}
			else {
				return TRUE;
			}
		}
		

	}
?>
