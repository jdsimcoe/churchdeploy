<?php

	Class extension_scaffolds extends Extension{

		public function about() {
			return array(
				'name'         => 'Scaffolds',
				'version'      => '0.5',
				'release-date' => '2012-02-03',
				'author'       => array(
					'name'    => 'Brendan Abbott',
					'email'   => 'brendan@bloodbone.ws'
				),
				'description'	=> 'A Symphony extension that allows a developer to quickly create Sections using JSON'
			);
		}

		public function getSubscribedDelegates(){
			return array(
				array(
					'page'     => '/backend/',
					'delegate' => 'InitaliseAdminPageHead',
					'callback' => 'appendAssets'
				),
				array(
					'page'     => '/blueprints/sections/',
					'delegate' => 'AddSectionElements',
					'callback' => 'addSectionElements'
				),
			);
		}

	/*-------------------------------------------------------------------------
		Delegates:
	-------------------------------------------------------------------------*/

		public function appendAssets() {
			if(class_exists('Administration')
				&& Administration::instance() instanceof Administration
				&& Administration::instance()->Page instanceof contentBlueprintsSections
			) {
				Administration::instance()->Page->addStylesheetToHead(URL . '/extensions/scaffolds/assets/scaffolds.sections.css', 'screen', 10000, false);
				Administration::instance()->Page->addScriptToHead(URL . '/extensions/scaffolds/assets/scaffolds.sections.js', 10001, false);
			}
		}

		public function addSectionElements(array $context = array()) {
			$callback = Administration::instance()->getPageCallback();

			$ul = new XMLElement('ul');
			$ul->setAttribute('id', 'scaffolds');

			// Add 'Import'
			$a = Widget::Anchor(__('Import'), '#', __('Import a Section definition'), 'create button', NULL, array('accesskey' => 'c'));
			$a->setAttribute('data-action', 'import');
			$ul->appendChild(
				new XMLElement('li', $a->generate())
			);

			// If we are editing a Section, add 'Export'
			if($callback['context'][0] == 'edit') {
				$a = Widget::Anchor(__('Export'), '#', __('Export this Section definition'), 'create button', NULL, array('accesskey' => 'c'));
				$a->setAttribute('data-action', 'export');
				$ul->appendChild(
					new XMLElement('li', $a->generate())
				);
			}

			// Scaffolds Area
			$div = new XMLElement('div');
			$div->setAttribute('id', 'scaffolds-area');
			$div->appendChild($ul);

			if($ul->getNumberOfChildren() == 2) {
				$div->appendChild(
					Widget::Anchor('⬇', '#scaffolds', __('Select'), 'button', NULL, array('accesskey' => 'c'))
				);
			}

			$context['form']->prependChild($div);
		}

	}
