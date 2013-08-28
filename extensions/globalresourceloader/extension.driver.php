<?php

	require_once(TOOLKIT . '/class.datasourcemanager.php');

	class Extension_GlobalResourceLoader extends Extension {
	/*-------------------------------------------------------------------------
		Definition:
	-------------------------------------------------------------------------*/

		public function uninstall() {
			Symphony::Configuration()->remove('globalresourceloader');
			return Symphony::Configuration()->write();
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
					'name'		=> __('Global Resources'),
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

			return Symphony::Configuration()->write();
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
