<?php

	require_once(TOOLKIT . '/class.administrationpage.php');

	class contentExtensionGlobalParamLoaderSets extends AdministrationPage {
		protected $_action = '';
		protected $_driver = null;
		protected $_editing = false;
		protected $_errors = array();
		protected $_fields = array();
		protected $_pages = array();
		protected $_status = '';
		protected $_sets = array();
		protected $_uri = null;
		protected $_valid = true;

		public function __construct(){
			parent::__construct();

			$this->_uri = URL . '/symphony/extension/globalparamloader';
			$this->_driver = Symphony::ExtensionManager()->create('globalparamloader');
		}

		public function build($context) {
			if (isset($context[0]) && ($context[0] == 'edit' || $context[0] == 'new')) {
				if ($this->_editing = $context[0] == 'edit') {
					$this->_fields = $this->_driver->getSet((integer)$context[1]);
					$this->_params = $this->_driver->getParameters((integer)$context[1]);
				}

				$this->_fields = (isset($_POST['fields']) ? $_POST['fields'] : $this->_fields);
				$this->_params = (isset($_POST['params']) ? $_POST['params'] : $this->_params);
				$this->_status = $context[2];
				$this->_pages = $this->_driver->getPages();
			} else {
				$this->_sets = $this->_driver->getSets();
			}

			parent::build($context);
		}

		public function __actionNew() {
			$this->__actionEdit();
		}

		public function __actionEdit() {
			if (isset($_POST['action']) && array_key_exists('delete', $_POST['action'])) {
				$this->__actionEditDelete();

			} else {
				$this->__actionEditNormal();
			}
		}

		public function __actionEditDelete() {
			Symphony::Database()->delete('tbl_gpl_sets', " `id` = '{$this->_fields['id']}'");
			Symphony::Database()->delete('tbl_gpl_params', " `set_id` = '{$this->_fields['id']}'");

			redirect("{$this->_uri}/sets/");
		}

		public function __actionEditNormal() {
			if(!is_array($this->_params)) $this->_params = array();
			
		// Validate: ----------------------------------------------------------

			if (empty($this->_fields['name'])) {
				$this->_errors['name'] = __('Name must not be empty.');
			}

			if  (empty($this->_params)) {
				$this->_errors['params'] = __('Parameters must not be empty.');
			}

			foreach ($this->_params as $sortorder => $param) {
				if (empty($param['param'])) {
					$this->_errors["{$sortorder}:param"] = __('Parameter must not be empty.');
				}
			}

			if (!empty($this->_errors)) {
				$this->_valid = false;
				return;
			}

		// Save: --------------------------------------------------------------

			$this->_fields['params'] = (integer)count($this->_params);
			if($this->_fields['exclude_page']) $this->_fields['exclude_page'] = implode(',', $this->_fields['exclude_page']);

			Symphony::Database()->insert($this->_fields, 'tbl_gpl_sets', true);
			Symphony::Database()->update($this->_fields, 'tbl_gpl_sets', "`id` = '".$this->_fields['id']."'");

			if (!$this->_editing) {
				$redirect_mode = 'created';

				$set_id = Symphony::Database()->fetchVar('id', 0, "
					SELECT
						s.id
					FROM
						`tbl_gpl_sets` AS s
					ORDER BY
						s.id DESC
					LIMIT 1
				");

			} else {
				$redirect_mode = 'saved';
				$set_id = $this->_fields['id'];
			}

			// Remove all parameters before adding existing ones
			Symphony::Database()->delete('tbl_gpl_params', " `set_id` = '{$this->_fields['id']}'");

			foreach ($this->_params as $param) {
				$param['set_id'] = $set_id;

				Symphony::Database()->insert($param, 'tbl_gpl_params', true);

			}

			redirect("{$this->_uri}/sets/edit/{$set_id}/{$redirect_mode}/");
		}

		public function __viewNew() {
			$this->__viewEdit();
		}

		public function __viewEdit() {
		// Status: -----------------------------------------------------------

			if (!$this->_valid) $this->pageAlert(
				__('An error occurred while processing this form. <a href="#error">See below for details.</a>'),
				Alert::ERROR
			);

			// Status message:
			if ($this->_status) {
				$action = null;

				switch($this->_status) {
					case 'saved': $action = '%1$s updated at %2$s. <a href="%3$s">Create another?</a> <a href="%4$s">View all %5$s</a>'; break;
					case 'created': $action = '%1$s created at %2$s. <a href="%3$s">Create another?</a> <a href="%4$s">View all %5$s</a>'; break;
				}

				if ($action) $this->pageAlert(
					__(
						$action, array(
							__('Parameter Set'),
							DateTimeObj::get(__SYM_TIME_FORMAT__),
							URL . '/symphony/extension/globalparamloader/sets/new/',
							URL . '/symphony/extension/globalparamloader/sets/',
							__('Parameter Sets')
						)
					),
					Alert::SUCCESS
				);
			}

			// Edit:
			if ($this->_action == 'edit') {
				if ($this->_set > 0) {
					$row = Symphony::Database()->fetchRow(0, "
						SELECT
							s.*
						FROM
							`tbl_gpl_sets` AS s
						WHERE
							s.id = {$this->_set}
					");

					if (!empty($row)) {
						$this->_fields = $row;
					} else {
						$this->_editing = false;
					}
				}
			}

		// Header: ------------------------------------------------------------

			$this->setPageType('single');
			$this->setTitle(__('Symphony &ndash; Global Parameter Sets') . (
				$this->_editing ? ' &ndash; ' . $this->_fields['name'] : null
			));
			$this->appendSubheading($this->_editing ? $this->_fields['name'] : 'Untitled');
			$this->insertBreadcrumbs(array(
				Widget::Anchor(__('Parameter Sets'), $this->_uri . '/sets/'),
			));

		// Form: --------------------------------------------------------------

			$fieldset = new XMLElement('fieldset');
			$fieldset->setAttribute('class', 'settings');
			$fieldset->appendChild(new XMLElement('legend', __('Essentials')));

			if (!empty($this->_fields['id'])) {
				$fieldset->appendChild(Widget::Input("fields[id]", $this->_fields['id'], 'hidden'));
			}

			$label = Widget::Label(__('Name'));
			$label->appendChild(Widget::Input(
				'fields[name]',
				General::sanitize($this->_fields['name'])
			));

			if (isset($this->_errors['name'])) {
				$label = Widget::wrapFormElementWithError($label, $this->_errors['name']);
			}

			$fieldset->appendChild($label);

			$this->Form->appendChild($fieldset);


		// Duplicator: --------------------------------------------------------------

			$fieldset = new XMLElement('fieldset');
			$fieldset->setAttribute('class', 'settings');
			$fieldset->appendChild(new XMLElement('legend', __('Parameters')));

			$div = new XMLElement('div');
			
			$ol = new XMLElement('ol');
			$ol->setAttribute('class', 'filters-duplicator');
			$ol->setAttribute('data-add', __('Add parameter'));
			$ol->setAttribute('data-remove', __('Remove parameter'));

			// Add existing parameters:
			if(isset($this->_params)) {
				foreach ($this->_params as $sortorder => $param) {
					$wrapper = new XMLElement('li');

					$this->displayParameter($wrapper, $sortorder, $param);

					$ol->appendChild($wrapper);
				}
			}

			// Add parameter set:
			$wrapper = new XMLElement('li');
			$wrapper->setAttribute('class', 'template');
			$wrapper->setAttribute('data-type', 'definiton');
			
			$this->displayParameter($wrapper, '-1', array(
				'type' => __('Parameter definition')
			));

			$ol->appendChild($wrapper);

			$div->appendChild($ol);
			$fieldset->appendChild($div);

			$this->Form->appendChild($fieldset);

		// Excluded Pages --------------------------------------------------------

			$fieldset = new XMLElement('fieldset');
			$fieldset->setAttribute('class', 'settings');
			$fieldset->appendChild(new XMLElement('legend', __('Pages')));

			$group = new XMLElement('div');
			$group->setAttribute('class', 'group');

			$this->viewIndexPages($group, $this->_fields['id']);

			$fieldset->appendChild($group);

			$this->Form->appendChild($fieldset);

		// Footer: ------------------------------------------------------------

			$div = new XMLElement('div');
			$div->setAttribute('class', 'actions');
			$div->appendChild(
				Widget::Input('action[save]',
					($this->_editing ? __('Save Changes') : __('Create Parameter Set')),
					'submit', array(
						'accesskey'		=> 's'
					)
				)
			);

			if ($this->_editing) {
				$button = new XMLElement('button', __('Delete'));
				$button->setAttributeArray(array(
					'name' => 'action[delete]',
					'class' => 'button confirm delete',
					'title' => __('Delete this Parameter Set')
				));
				$div->appendChild($button);
			}

			$this->Form->appendChild($div);
		}

		protected function displayParameter(&$wrapper, $sortorder, $param) {
			$header = new XMLElement('header');
			$header->appendChild(new XMLElement('h4', ucwords($param['type'])));
			$wrapper->appendChild($header);
			$wrapper->appendChild(Widget::Input("params[{$sortorder}][type]", $param['type'], 'hidden'));

			if (!empty($param['id'])) {
				$wrapper->appendChild(Widget::Input("params[{$sortorder}][id]", $param['id'], 'hidden'));
			}

		// Parameter name ------------------------------------------------------------

			$div = new XMLElement('div');
			$div->setAttribute('class', 'group');

			$label = Widget::Label(__('Parameter name'));
			$label->appendChild(Widget::Input(
				"params[{$sortorder}][param]",
				General::sanitize($param['param'])
			));

			if (isset($this->_errors["{$sortorder}:param"])) {
				$label = Widget::wrapFormElementWithError($label, $this->_errors["{$sortorder}:param"]);
			}

			$div->appendChild($label);

		// Parameter Value --------------------------------------------------------

			$label = Widget::Label(__('Parameter value'));
			$label->appendChild(Widget::Input(
				"params[{$sortorder}][value]",
				General::sanitize($param['value'])
			));

			if (isset($this->_errors["{$sortorder}:value"])) {
				$label = Widget::wrapFormElementWithError($label, $this->_errors["{$sortorder}:value"]);
			}

			$div->appendChild($label);
			$wrapper->appendChild($div);
		}

		public function viewIndexPages($context, $set_id = Null) {
			$pages = PageManager::fetch();
			$options = array();

			foreach ($pages as $page) {
				$selected = $this->_driver->isPageSelected($page['id'], $set_id);
				$options[] = array(
					$page['id'], $selected, '/' . PageManager::resolvePagePath($page['id'])
				);
			}

			$section = Widget::Label('Excluded Pages');
			$section->appendChild(Widget::Select(
				'fields[exclude_page][]', $options, array(
					'multiple' => 'multiple'
				)
			));

			$context->appendChild($section);
		}

	/*-------------------------------------------------------------------------
		Index
	-------------------------------------------------------------------------*/

		public function __actionIndex() {
			$checked = (
				(isset($_POST['items']) && is_array($_POST['items']))
					? array_keys($_POST['items'])
					: null
			);

			if (is_array($checked) and !empty($checked)) {
				switch ($_POST['with-selected']) {
					case 'delete':
						foreach ($checked as $set_id) {
							Symphony::Database()->query("
								DELETE FROM
									`tbl_gpl_sets`
								WHERE
									`id` = {$set_id}
							");

							Symphony::Database()->query("
								DELETE FROM
									`tbl_gpl_params`
								WHERE
									`set_id` = {$set_id}
							");
						}

						redirect("{$this->_uri}/sets/");
						break;
				}
			}
		}

		public function __viewIndex() {
			$this->setPageType('index');
			$this->setTitle(__('Symphony &ndash; Global Parameter Sets'));

			$this->appendSubheading(__('Parameter Sets'), Widget::Anchor(
				__('Create New'), "{$this->_uri}/sets/new/",
				__('Create a new parameter set'), 'create button'
			));

			$tableHead = array(
				array(__('Parameter Set Name'), 'col'),
				array(__('Parameters'), 'col')
			);

			$tableBody = array();

			if (!is_array($this->_sets) or empty($this->_sets)) {
				$tableBody = array(
					Widget::TableRow(array(Widget::TableData(__('None Found.'), 'inactive', null, count($tableHead))))
				);

			} else {
				foreach ($this->_sets as $set) {
					$set = (object)$set;

					$col_name = Widget::TableData(
						Widget::Anchor(
							$set->name,
							"{$this->_uri}/sets/edit/{$set->id}/"
						)
					);
					$col_name->appendChild(Widget::Input("items[{$set->id}]", null, 'checkbox'));

					if (!empty($set->params)) {
						$col_params = Widget::TableData($set->params);

					} else {
						$col_params = Widget::TableData('None', 'inactive');
					}

					$tableBody[] = Widget::TableRow(array($col_name, $col_params), null);
				}
			}

			$table = Widget::Table(
				Widget::TableHead($tableHead), null,
				Widget::TableBody($tableBody)
			);
			$table->setAttribute('class', 'selectable');

			$this->Form->appendChild($table);
			
			$actions = new XMLElement('div');
			$actions->setAttribute('class', 'actions');

			$options = array(
				array(null, false, __('With Selected...')),
				array('delete', false, __('Delete'))
			);

			$actions->appendChild(Widget::Apply($options));

			$this->Form->appendChild($actions);
		}
	}

?>