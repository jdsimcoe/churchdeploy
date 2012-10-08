<?php
	
	require_once(TOOLKIT . '/class.datasourcemanager.php');
	
	class Extension_GlobalResourceLoader extends Extension {
	/*-------------------------------------------------------------------------
		Definition:
	-------------------------------------------------------------------------*/
		
		public function about() {
			return array(
				'name'			=> 'Global Resource Loader',
				'version'		=> '1.0.5',
				'release-date'	=> '2011-03-03',
				'author'		=> array(
					'name'			=> 'Rowan Lewis',
					'website'		=> 'http://rowanlewis.com',
					'email'			=> 'me@rowanlewis.com'
				),
				'description'	=> 'Allows you to select datasources and events to be used on all pages.'
	 		);
		}
		
		public function uninstall() {
			Symphony::Engine()->Configuration->remove('globalresourceloader');
			Symphony::Engine()->saveConfig();
		}
		
		public function getSubscribedDelegates() {
			return array(
				array(
					'page'		=> '/frontend/',
					'delegate'	=> 'FrontendPageResolved',
					'callback'	=> 'manipulatePageData'
				),
				array(
					'page'		=> '/system/preferences/',
					'delegate'	=> 'AddCustomPreferenceFieldsets',
					'callback'	=> 'preferences'
				)
			);
		}
		
		public function fetchNavigation() {
			return array(
				array(
					'location'	=> __('Blueprints'),
					'name'		=> __('Globals'),
					'link'		=> '/preferences/'
				)
			);
		}
		
		public function manipulatePageData($context) {
		// Events -------------------------------------------------------------
			
			$events = $context['page_data']['events'];
			$events = explode(',', $events);
			$events = array_merge($events, $this->getEventNames());
			$events = array_unique($events);
			$events = implode(',', $events);
			
		// Datasources --------------------------------------------------------
			
			$datasources = $context['page_data']['data_sources'];
			$datasources = explode(',', $datasources);
			$datasources = array_merge($datasources, $this->getDSNames());
			$datasources = array_unique($datasources);
			$datasources = implode(',', $datasources);
			
		// Apply --------------------------------------------------------------
			
			// Ignore excluded pages:
			if (!$this->isDSPageSelected($context['page_data']['id'])) {
				$context['page_data']['data_sources'] = $datasources;
			}
			
			if (!$this->isEventPageSelected($context['page_data']['id'])) {
				$context['page_data']['events'] = $events;
			}
		}
		
	/*-------------------------------------------------------------------------
		Utilities:
	-------------------------------------------------------------------------*/
		
		public function setConfig($name, $values) {
			if (is_array($values)) {
				$values = implode(',', $values);
				Symphony::Configuration()->set($name, $values, 'globalresourceloader');
			}
			
			else {
				Symphony::Configuration()->remove($name, 'globalresourceloader');
			}
			
			Symphony::Engine()->saveConfig();
		}
		
	/*-------------------------------------------------------------------------
		Events:
	-------------------------------------------------------------------------*/
		
		public function getEventNames() {
			return explode(',', Symphony::Configuration()->get('event-names', 'globalresourceloader'));
		}
		
		public function getEventPages() {
			return explode(',', Symphony::Configuration()->get('event-pages', 'globalresourceloader'));
		}
		
		public function setEventNames($values) {
			$this->setConfig('event-names', $values);
		}
		
		public function setEventPages($values) {
			$this->setConfig('event-pages', $values);

		}
		
		public function isEventNameSelected($handle) {
			$datasources = $this->getEventNames();
			
			return in_array($handle, $datasources);
		}
		
		public function isEventPageSelected($id) {
			$pages = $this->getEventPages();
			
			return in_array($id, $pages);
		}
		
	/*-------------------------------------------------------------------------
		Datasources:
	-------------------------------------------------------------------------*/
		
		public function getDSNames() {
			return explode(',', Symphony::Configuration()->get('ds-names', 'globalresourceloader'));
		}
		
		public function getDSPages() {
			return explode(',', Symphony::Configuration()->get('ds-pages', 'globalresourceloader'));
		}
		
		public function setDSNames($values) {
			//var_dump($values); exit;
			$this->setConfig('ds-names', $values);
		}
		
		public function setDSPages($values) {
			$this->setConfig('ds-pages', $values);
		}
		
		public function isDSNameSelected($handle) {
			$datasources = $this->getDSNames();
			
			return in_array($handle, $datasources);
		}
		
		public function isDSPageSelected($id) {
			$pages = $this->getDSPages();
			
			return in_array($id, $pages);
		}
	}


