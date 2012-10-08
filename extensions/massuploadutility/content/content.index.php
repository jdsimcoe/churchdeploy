<?php

	require_once(TOOLKIT . '/class.administrationpage.php');
	require_once(TOOLKIT . '/class.sectionmanager.php');
	require_once(TOOLKIT . '/class.entrymanager.php');
	require_once(CORE . '/class.frontend.php');
	require_once(CONTENT . '/content.publish.php');

	/**
	 * Called to build the content for the page. 
	 */

	class contentExtensionMassUploadUtilityIndex extends contentPublish {
		
		public function getSectionId() {
			$sectionManager = new SectionManager(Frontend::instance());
			
			$section_id = $sectionManager->fetchIDFromHandle(General::sanitize($_REQUEST['MUUsource']));

			if(!$section = $sectionManager->fetch($section_id))
				return NULL;
			else
				return $section_id;
		}
		/**
		 *
		 * _REQUEST in view() are used because jquery.html5_upload.js can't deal 
		 *		with extra variables in the POST
		 * Should this change, view() will need to be changed to action()
		 *	---------------------------------------------------------
		 */
		public function view() {

			if (!isset($_REQUEST['MUUsource']) or $_REQUEST['MUUsource'] == '')
			{ exit; }	

			if (($section_id = $this->getSectionId()) === NULL)
			{ exit; }	

			$_POST = $_REQUEST;
			$_POST['action']['save'] = true;
			$_POST['action']['muu'] = true;

			// this is used by contentPublish to see the source section
			$this->_context['section_handle'] = General::sanitize($_REQUEST['MUUsource']);

			// this function takes care of all the entry adding
			$this->__actionNew();

			// we only get here if there's an error
			$response['errors'] = $this->_errors;
			$response['status'] = (count($this->_errors) ? 'error' : 'success');
			$response['message'] = ($this->Alert instanceof Alert ? $this->Alert->__get('message') : '');

			echo(json_encode($response));
				
			exit;
		}


	}
?>
