<?php

	require_once(TOOLKIT . '/class.entrymanager.php');
	
	
	Class extension_root_page_params extends Extension{
	
		protected $section_data;
		protected $_page;
		protected $static_section_name;
		
		static $alreadyRan = false;
		
		public function about(){
			return array('name' => 'Root page params',
						 'version' => '1.2',
						 'release-date' => '2009-12-10',
						 'author' => array('name' => 'Huib Keemink',
										   'website' => 'http://www.creativedutchmen.com',
										   'email' => 'huib@creativedutchmen.com')
				 		);
		}
		
		public function getSubscribedDelegates(){
			return array(
						array(
							'page' => '/frontend/',
							'delegate' => 'FrontendPrePageResolve',
							'callback' => 'addPage'
						),
						array(
							'page' => '/system/preferences/',
							'delegate' => 'AddCustomPreferenceFieldsets',
							'callback' => 'append_preferences'
						),
						array(
							'page' => '/system/preferences/',
							'delegate' => 'Save',
							'callback' => 'save_settings'
						),
			);
		}
		
		public function addPage(&$context){
		
			//to prevent the callback loop
			if(!$this->alreadyRan){
				$this->alreadyRan = true;
				//the only way to access the current (active) pages.
				$front = FrontEnd::Page();
				
				if(!$front->resolvePage($context['page'])){
					//uses home page if no page is set in the config panel.
					if($this->_get_fallback() == ''){
						$indexPage = $this->__getIndexPage();
						$indexHandle = $indexPage['handle'];
					}
					else{
						$indexHandle = $this->_get_fallback();
					}
					
					//adds the home page to the handle, if the current page is not found.
					//requires the home page to fallback to a 404 if the params do not match, otherwise no 404 error will ever be created.
					
					$params = $context['page'];
					
					if($this->_Parent->Configuration->get('map_sub_to_front', 'maptofront') == 'no'){
						$tmp = substr($indexHandle,0, strrpos($indexHandle, '/'));
						if(strlen($tmp) > 0){
							$params = substr($context['page'], strpos($context['page'], $tmp)+strlen($tmp));
						}
						else{
							$params = '';
						}
					}
					$context['page'] = $indexHandle.$params;
				}
			}
			
		}
		
		
		public function append_preferences(&$context)
		{
			# Add new fieldset
			$group = new XMLElement('fieldset');
			$group->setAttribute('class', 'settings');
			$group->appendChild(new XMLElement('legend', 'Root Page Params'));

			# Add Site Reference field
			//$label = Widget::Label('Fallback page');
			//$label->appendChild(Widget::Input('settings[maptofront][fallback]', General::Sanitize($this->_get_fallback())));
			
			//try to add a select box for the page (more user friendly)
			$label = Widget::Label(__('Page to append parameters to'));
			
			$pages = $this->_Parent->Database->fetch("
				SELECT
					p.*
				FROM
					`tbl_pages` AS p
				WHERE
					p.id != '{mysql_real_escape_string($page_id)}'
				ORDER BY
					p.title ASC
			");
			
			$options = array(
				array('', false, '')
			);
			
			if (is_array($pages) && !empty($pages)) {
				if (!function_exists('__compare_pages')) {
					function __compare_pages($a, $b) {
						return strnatcasecmp($a[2], $b[2]);
					}
				}
				
				foreach ($pages as $page) {
					$options[] = array(
						$this->_Parent->resolvePagePath($page['id']), $this->_Parent->Configuration->get('fallback', 'maptofront') == $this->_Parent->resolvePagePath($page['id']),
						'/'.$this->_Parent->resolvePagePath($page['id'])
					);
				}
				
				usort($options, '__compare_pages');
			}
			
			$label->appendChild(Widget::Select(
				'settings[maptofront][fallback]', $options
			));
			
			$group->appendChild($label);
			$group->appendChild(new XMLElement('p', 'The page to append the parameters to. Leave empty for home (default).', array('class' => 'help')));
			
			$label = Widget::Label();
			$input = Widget::Input('settings[maptofront][map_sub_to_front]', 'yes', 'checkbox');
			if($this->_Parent->Configuration->get('map_sub_to_front', 'maptofront') == 'yes') $input->setAttribute('checked', 'checked');
			$label->setValue($input->generate() . ' ' . __('Map supages to home page'));
			
			$group->appendChild($label);
			$group->appendChild(new XMLElement('p', 'Maps subpages to the root page when checked, maps subpages to their parents if unchecked.', array('class' => 'help')));
			
			$context['wrapper']->appendChild($group);
		}
		
		//any way to get this without using the database?
		function __getIndexPage(){
			$row = $this->_Parent->Database->fetchRow(0, "SELECT `tbl_pages`.* FROM `tbl_pages`, `tbl_pages_types` 
															  WHERE `tbl_pages_types`.page_id = `tbl_pages`.id 
															  AND tbl_pages_types.`type` = 'index' 
															  LIMIT 1");
			return $row;
		}
		
		function _get_fallback(){
			$default_fallback = '';
			$val = $this->_Parent->Configuration->get('fallback', 'maptofront');
			
			return (isset($val)) ? $val : $default_fallback;
		}
		
		function save_settings($context){
			if(!isset($context['settings']['maptofront']['map_sub_to_front'])) $context['settings']['maptofront']['map_sub_to_front'] = 'no';
			
			if(!isset($context['settings']['maptofront'])){
				$context['settings']['maptofront'] = array('map_sub_to_front' => 'no');
			}
		}
	}
