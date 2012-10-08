<?php 

require_once(TOOLKIT . '/class.administrationpage.php');

define_safe('BASE_URL', URL . '/symphony/extension/configuration/settings');

Class contentExtensionConfigurationSettings extends AdministrationPage{

    private $_driver;
	private $_page;
	private $_flag;

    function __construct(&$parent){
        parent::__construct($parent);
		
        $this->_driver = Symphony::ExtensionManager()->create('configuration');
    }
	
	function view(){			
		$this->__switchboard();	
	}
	
	function action(){			
		$this->__switchboard('action');
		if (array_key_exists('save', $_POST['action'])) $this->save();
		if (array_key_exists('edit', $_POST['action'])) $this->edit();
	}

	function __switchboard($type='view'){

		$this->_page = $this->_context['0'];
		$this->_flag = $this->_context['1'];
	
		$function = ($type == 'action' ? '__action' : '__view') . (isset($this->_page) ? ucfirst($this->_page) : 'Index') ;
		
		if(!method_exists($this, $function)) {
			
			## If there is no action function, just return without doing anything
			if($type == 'action') return;
			
			Symphony::Engine()->errorPageNotFound();
			
		}
		
		$this->$function();

	}
	
	function __viewIndex(){			

		$link = new XMLElement('link');
		$this->addElementToHead($link, 500);

		$this->setTitle(__('%1$s &ndash; %2$s', array(__('Symphony'), __('Configuration'))));
        $this->setPageType('table');

		$this->appendSubheading(__('Configuration'));
		
		## Table Headings
		$aTableHead = array(
			array('Group', 'col'),
			array('Setting', 'col'),
			array('Value', 'col')
		);			
		
		## Get Configuration Settings and display as a table list
		$config_settings = Symphony::Configuration()->get();

		$tableData = array();

		foreach($config_settings as $key => $groups)
		{
			foreach($groups as $name => $value) {
				$setting_group = $key;
				$setting_name = $name;
				$setting_value = $value;
			
				$tableData[] = Widget::TableData($setting_group);
				$tableData[] = Widget::TableData($setting_name);
				$tableData[] = Widget::TableData($setting_value);
			
				$aTableBody[] = Widget::TableRow($tableData, ($bEven ? 'even' : NULL));

				$bEven = !$bEven;
					
				unset($tableData);		
			}
		}

		$table = Widget::Table(Widget::TableHead($aTableHead), NULL, Widget::TableBody($aTableBody));
		$this->Form->appendChild($table);

		## Edit Button
		$tableActions = new XMLElement('div');
		$tableActions->setAttribute('class', 'actions');
		$tableActions->appendChild(Widget::Input('action[edit]', __('Edit Settings'), 'submit'));
        $this->Form->appendChild($tableActions); 
	}

	function __viewEdit(){			
	
		$link = new XMLElement('link');
		$this->addElementToHead($link, 500);

		$this->setTitle(__('%1$s &ndash; %2$s', array(__('Symphony'), __('Configuration'))));
        $this->setPageType('form');

		$this->appendSubheading(__('Configuration'));

		## Get Configuration Settings and display as a table list
		$config_settings = Symphony::Configuration()->get();

		$count = 0;

		foreach($config_settings as $key => $groups)
		{
			$setting_group = $key;

			$fieldset = new XMLElement('fieldset');
			$fieldset->setAttribute('class', 'settings type-file');
			$fieldset->appendChild(new XMLElement('legend', __(strtoupper(str_replace('_', ' ', $setting_group)))));

			foreach($groups as $name => $value) {
				$setting_name = $name;
				$setting_value = $value;
				
				$setting_group_data = '<input name="settings[' . $count . '][group]" type="hidden" value="' . $setting_group . '" />' . strtoupper($setting_group);
				$setting_name_data = '<input name="settings[' . $count . '][name]" type="hidden" value="' . $setting_name . '" />' . $setting_name;
				
				$label = Widget::Label(ucfirst(str_replace('_', ' ', $setting_name)));
				$label->appendChild(Widget::Input('settings[' . $count . '][group]', $setting_group, 'hidden'));
				$label->appendChild(Widget::Input('settings[' . $count . '][name]', $setting_name, 'hidden'));
				$label->appendChild(Widget::Input('settings[' . $count . '][value]', htmlspecialchars($setting_value)));
				$fieldset->appendChild($label);
				
				$count++;

			}

			$this->Form->appendChild($fieldset);

		}

		## Save Button
		$div = new XMLElement('div');
		$div->setAttribute('class', 'actions');
		$div->appendChild(Widget::Input('action[save]', __('Save Settings'), 'submit', array('accesskey' => 's')));
		$this->Form->appendChild($div);

		## Notice Messages
		if(isset($this->_flag))
		{
			switch($this->_flag){
				
				case 'saved':
					$this->pageAlert(__('Configuration Settings updated successfully.'), Alert::SUCCESS);
					break;
					
				case 'error':
					$this->pageAlert(__('An error occurred.'), Alert::NOTICE);
					break;
				
			}
		}
	}

	function save() {
		$settings = $_POST['settings'];
		$count = count($settings) - 1;
		for ($i=0; $i<=$count; $i++) {
			$setting_group = $settings[$i]['group'];
			$setting_name = $settings[$i]['name'];
			$setting_value = $settings[$i]['value'];

			Symphony::Configuration()->set($setting_name, $setting_value, $setting_group);
		}
		Administration::instance()->saveConfig();
		return redirect(BASE_URL . '/edit/saved/');
	}

	function edit() {
		return redirect(BASE_URL . '/edit/');
	}
	
}
?>