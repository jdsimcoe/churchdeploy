<?php

	Class extension_admin_css_override extends Extension{

		public function getSubscribedDelegates(){
			return array(
				array(
					'page'     => '/backend/',
					'delegate' => 'InitaliseAdminPageHead',
					'callback' => 'appendAssets'
				),
			);
		}

	/*-------------------------------------------------------------------------
		Delegates:
	-------------------------------------------------------------------------*/

		public function appendAssets() {
			Administration::instance()->Page->addStylesheetToHead(URL . '/extensions/admin_css_override/assets/admin_css_override.css', 'screen', 1000, false);
		}

	}
