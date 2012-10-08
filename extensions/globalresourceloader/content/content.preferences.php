<?php

	require_once(TOOLKIT . '/class.administrationpage.php');
	require_once(TOOLKIT . '/class.datasourcemanager.php');	
	require_once(TOOLKIT . '/class.eventmanager.php');	
	
	class contentExtensionGlobalResourceLoaderPreferences extends AdministrationPage {
		protected $driver;
		
		public function __viewIndex() {
			$this->driver = Symphony::ExtensionManager()->create('globalresourceloader');
			$bIsWritable = true;
			
		    if (!is_writable(CONFIG)) {
		        $this->pageAlert(__('The Symphony configuration file, <code>/manifest/config.php</code>, is not writable. You will not be able to save changes to preferences.'), AdministrationPage::PAGE_ALERT_ERROR);
		        $bIsWritable = false;
		    }
			
			$this->setPageType('form');
			$this->setTitle('Symphony &ndash; ' . __('Global Resources'));
			
			$this->appendSubheading(__('Global Resources'));
			
		// Events --------------------------------------------------------
			
			$container = new XMLElement('fieldset');
			$container->setAttribute('class', 'settings');
			$container->appendChild(
				new XMLElement('legend', __('Events'))
			);
			
			$group = new XMLElement('div');
			$group->setAttribute('class', 'group');
			
			$this->__viewIndexEventNames($group);
			$this->__viewIndexEventPages($group);
			
			$container->appendChild($group);
			$this->Form->appendChild($container);
			
		// Datasources --------------------------------------------------------
			
			$container = new XMLElement('fieldset');
			$container->setAttribute('class', 'settings');
			$container->appendChild(
				new XMLElement('legend', __('Datasources'))
			);
			
			$group = new XMLElement('div');
			$group->setAttribute('class', 'group');
			
			$this->__viewIndexDSNames($group);
			$this->__viewIndexDSPages($group);
			
			$container->appendChild($group);
			$this->Form->appendChild($container);
			
		//---------------------------------------------------------------------
			
			$div = new XMLElement('div');
			$div->setAttribute('class', 'actions');
			
			$attr = array('accesskey' => 's');
			if (!$bIsWritable) $attr['disabled'] = 'disabled';
			$div->appendChild(Widget::Input('action[save]', __('Save Changes'), 'submit', $attr));

			$this->Form->appendChild($div);
		}
		
	/*-------------------------------------------------------------------------
		Events:
	-------------------------------------------------------------------------*/
		
		public function __viewIndexEventNames($context) {
			$EventManager = new EventManager(Symphony::Engine());
			$events = $EventManager->listAll();
			$options = array();
			
			foreach ($events as $event) {
				$selected = $this->driver->isEventNameSelected($event['handle']);
				
				$options[] = array(
					$event['handle'], $selected, $event['name']
				);
			}
			
			$section = Widget::Label(__('Selected'));
			$section->appendChild(Widget::Select(
				'settings[event-names][]', $options, array(
					'multiple'	=> 'multiple'
				)
			));
			
			$context->appendChild($section);
		}
		
		public function __viewIndexEventPages($context) {
			$pages = Symphony::Database()->fetch("
				SELECT
					p.*
				FROM
					tbl_pages AS p
				ORDER BY
					p.sortorder ASC
			");
			$options = array();
			
			foreach ($pages as $page) {
				$selected = $this->driver->isEventPageSelected($page['id']);
				
				$options[] = array(
					$page['id'], $selected, '/' . Symphony::Engine()->resolvePagePath($page['id'])
				);
			}
			
			$section = Widget::Label(__('Excluded Pages'));
			$section->appendChild(Widget::Select(
				'settings[event-pages][]', $options, array(
					'multiple'	=> 'multiple'
				)
			));
			
			$context->appendChild($section);
		}
		
	/*-------------------------------------------------------------------------
		Datasources:
	-------------------------------------------------------------------------*/
		
		public function __viewIndexDSNames($context) {
			$DSManager = new DatasourceManager(Symphony::Engine());
			$datasources = $DSManager->listAll();
			$options = array();
			
			foreach ($datasources as $datasource) {
				$selected = $this->driver->isDSNameSelected($datasource['handle']);
				
				$options[] = array(
					$datasource['handle'], $selected, $datasource['name']
				);
			}
			
			$section = Widget::Label(__('Selected'));
			$section->appendChild(Widget::Select(
				'settings[ds-names][]', $options, array(
					'multiple'	=> 'multiple'
				)
			));
			
			$context->appendChild($section);
		}
		
		public function __viewIndexDSPages($context) {
			$pages = Symphony::Database()->fetch("
				SELECT
					p.*
				FROM
					tbl_pages AS p
				ORDER BY
					p.sortorder ASC
			");
			$options = array();
			
			foreach ($pages as $page) {
				$selected = $this->driver->isDSPageSelected($page['id']);
				
				$options[] = array(
					$page['id'], $selected, '/' . Symphony::Engine()->resolvePagePath($page['id'])
				);
			}
			
			$section = Widget::Label(__('Excluded Pages'));
			$section->appendChild(Widget::Select(
				'settings[ds-pages][]', $options, array(
					'multiple'	=> 'multiple'
				)
			));
			
			$context->appendChild($section);
		}
		
		public function __actionIndex() {
			$settings  = @$_POST['settings'];
			
			if (empty($this->driver)) {
				$this->driver = Symphony::ExtensionManager()->create('globalresourceloader');
			}
			
			if (@isset($_POST['action']['save'])) {
				$this->driver->setEventNames($settings['event-names']);
				$this->driver->setEventPages($settings['event-pages']);
				$this->driver->setDSNames($settings['ds-names']);
				$this->driver->setDSPages($settings['ds-pages']);
			}
		}
	}
	
?>
