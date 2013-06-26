<?php

	if(!defined("__IN_SYMPHONY__")) die("<h2>Error</h2><p>You cannot directly access this file</p>");

	/*
	Copyright: Deux Huit Huit 2012-2013
	License: MIT
	*/
	class extension_save_and_return extends Extension {

		public function getSubscribedDelegates(){
			return array(
				array(
					'page' => '/backend/',
					'delegate' => 'InitaliseAdminPageHead',
					'callback' => 'appendJS'
				),
				array(
					'page' => '/backend/',
					'delegate' => 'AdminPagePreGenerate',
					'callback' => 'appendElement'
				),
				array(
					'page' => '/publish/edit/',
					'delegate' => 'EntryPostEdit',
					'callback' => 'entryPostEdit'
				),
				array(
					'page' => '/publish/new/',
					'delegate' => 'EntryPostCreate',
					'callback' => 'entryPostEdit'
				)
			);
		}
		
		public function entryPostEdit($context) {
			$section = $context['section'];
			$errors = Administration::instance()->Page->_errors;
			
			$isReturn = isset($_POST['fields']['save-and-return-h']) && strlen($_POST['fields']['save-and-return-h']) > 1;
			$isNew = isset($_POST['fields']['save-and-new-h']) && strlen($_POST['fields']['save-and-new-h']) > 1;
			
			// if save returned no errors and return ou new button was hit
			if (($isReturn || $isNew) && count($errors) < 1) {
				redirect(sprintf(
					$this->getPath($isNew),
					SYMPHONY_URL,
					$section->get('handle')
				));
			}
		}
		
		public function appendElement($context) {
			// if in edit or new page
			if ($this->isInEditOrNew()) {
				
				// Get this section's limit
				$limits = $this->getSectionLimit();
				
				// Exit early if no limits where found
				if ($limits === FALSE || empty($limits) || !is_array($limits)) {
					return;
				}
				
				// Exit early if the limit is one
				if ($limits['limit'] == 1) {
					return;
				}
				
				// add new if limit is 0 or total is less than limit
				$shouldAddNew = $limits['limit'] == 0 || ($limits['total']+1) < $limits['limit'];
				
				// add return if the limit is not 1
				$shouldAddReturn = $limits['limit'] != 1;
				
				$page = $context['oPage'];
				
				$form = $page->Form;
				
				$button_wrap = new XMLELement('div', NULL, array(
					'id' => 'save-and',
					'style' => 'float:right'
				));
				
				if ($shouldAddReturn) {
					// add return button in wrapper
					$button_return = $this->createButton('save-and-return', 'Save & return');
					$hidden_return = $this->createHidden('save-and-return-h');
					
					$button_wrap->appendChild($button_return);
					$button_wrap->appendChild($hidden_return);
				}
				
				if ($shouldAddNew) {
					// add the new button
					$button_new = $this->createButton('save-and-new', 'Save & new');
					$hidden_new = $this->createHidden('save-and-new-h');
					
					$button_wrap->appendChild($button_new);
					$button_wrap->appendChild($hidden_new);
				}
				
				// add content to the right div
				$div_action = $this->getChildrenWithClass($form, 'div', 'actions');
				
				// if there is no fields, div_action may not be there
				if ($div_action != NULL) {
					$div_action->appendChild($button_wrap);
				}
			}
		}
		
		private function createButton($id, $value) {
			$btn = new XMLElement('input', NULL, array(
				'id' => $id,
				'name' => 'action[save]',
				'value' => __($value),
				'type' => 'submit'
			));
			$btn->setSelfClosingTag(true);
			
			return $btn;
		}
		
		private function createHidden($id) {
			$h = new XMLElement('input', NULL, array(
				'id' => $id,
				'name' => "fields[$id]",
				'type' => 'hidden'
			));
			$h->setSelfClosingTag(true);
			
			return $h;
		}
		
		private function getPath($isNew) {
			if ($isNew) {
				return '%s/publish/%s/new/';
			}
			return '%s/publish/%s/';
		}
		
		private function isInEditOrNew() {
			$c = Administration::instance()->getPageCallback();
			$c = $c['context']['page'];
			
			return Symphony::Engine()->isLoggedIn() && ($c == 'edit' || $c == 'new');
		}
		
		private function getChildrenWithClass($rootElement, $tagName, $className) {
			if (! ($rootElement) instanceof XMLElement) {
				return NULL; // not and XMLElement
			}
			
			// contains the right css class and the right node name
			if (strpos($rootElement->getAttribute('class'), $className) > -1 && $rootElement->getName() == $tagName) {
				return $rootElement;
			}
			
			// recursive search in child elements
			foreach ($rootElement->getChildren() as $child) {
				$res = $this->getChildrenWithClass($child, $tagName, $className);
				
				if ($res != NULL) {
					return $res;
				}
			}
			
			return NULL;
		}

		

		private function getSectionLimit(){
			$extman = Symphony::ExtensionManager();
			
			// limit section entries
			$status = $extman->fetchStatus(array('handle' => 'limit_section_entries', 'version' => '1'));
			
			if (in_array(EXTENSION_ENABLED, $status)) {
				require_once (EXTENSIONS . '/limit_section_entries/lib/class.LSE.php');
				$limit = LSE::getMaxEntries();
				$total = LSE::getTotalEntries();
				
				return array(
					'limit' => $limit,
					'total' => $total
				);
			}
			
			return FALSE;
		}

		public function appendJS($context){

			if ($this->isInEditOrNew()) {
			
				Administration::instance()->Page->addElementToHead(
					new XMLElement(
						'script',
						"(function($){
							$(function(){
								$('#save-and-return').click(function () {
									$('#save-and-return-h').val('true');
								});
								
								$('#save-and-new').click(function () {
									$('#save-and-new-h').val('true');
								});
							});
						})(jQuery);"
					), time()+100
				);
				
				// add CSS for subsection manager
				Administration::instance()->Page->addElementToHead(
					new XMLElement(
						'style',
						"body.inline.subsection #save-and { display: none; visibility: collapse }",
						array('type' => 'text/css')
					), time()+101
				);
			}
			
		}
	}
	
