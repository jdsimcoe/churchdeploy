<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceevents_entries_by_tag extends SectionDatasource {

		public $dsParamROOTELEMENT = 'events-entries-by-tag';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'date';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		public $dsParamCACHE = '0';
		

		public $dsParamFILTERS = array(
				'35' => 'later than now',
				'137' => '{$ds-tags-filtered.system-id:43}',
				'213' => 'no',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'system:pagination',
				'date'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array('$ds-tags-filtered.system-id');
		}

		public function about() {
			return array(
				'name' => 'Events: Entries by tag',
				'author' => array(
					'name' => 'Brian Zerangue',
					'website' => 'http://churchdeploy.site',
					'email' => 'brian.zerangue@gmail.com'),
				'version' => 'Symphony 2.3.2',
				'release-date' => '2013-07-28T05:55:42+00:00'
			);
		}

		public function getSource() {
			return '6';
		}

		public function allowEditorToParse() {
			return true;
		}

		public function execute(array &$param_pool = null) {
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				$result = parent::execute($param_pool);
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			return $result;
		}

	}
