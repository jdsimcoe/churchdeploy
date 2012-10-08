<?php
	Class extension_tweak_ui extends Extension
	{
		/**
		* About this extension:
		*/
		public function about()
		{
			return array(
				'name' => 'Tweak UI',
				'version' => '0.1.2',
				'release-date' => '2010-12-10',
				'author' => array(
					'name' => 'Giel Berkers',
					'website' => 'http://www.gielberkers.com',
					'email' => 'info@gielberkers.com'),
				'description' => 'Some tweaks to the UI'
			);
		}
		
		/**
		* Set the delegates
		*/
		public function getSubscribedDelegates()
		{
			return array(
				array(
					'page' => '/backend/',
					'delegate' => 'InitaliseAdminPageHead',
					'callback' => 'addScriptToHead'
				)
			);
		}
		
		/**
		 * Add script to the <head>-section of the admin area
		 */
		public function addScriptToHead($context)
		{
			Administration::instance()->Page->addScriptToHead(URL.'/extensions/tweak_ui/assets/custom.js', 301, true);
			Administration::instance()->Page->addStylesheetToHead(URL.'/extensions/tweak_ui/assets/custom.css', 'screen', 302);
			// Multiselect:
			Administration::instance()->Page->addScriptToHead(URL.'/extensions/tweak_ui/assets/jquery.simpleMultiSelect.js', 300, true);
		}	
	}
?>