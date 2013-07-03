<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcelocations_ds_events_entries_by_tag extends SectionDatasource {

		public $dsParamROOTELEMENT = 'locations-ds-events-entries-by-tag';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$ds-events-entries-by-tag';
		public $dsParamSORT = 'system:id';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		public $dsParamCACHE = '0';
		

		public $dsParamFILTERS = array(
				'id' => '{$ds-events-entries-by-tag}',
				'208' => 'no',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'name-formal: unformatted',
				'name-casual: unformatted',
				'description: unformatted',
				'address',
				'city',
				'state',
				'zip',
				'latitude',
				'longitude'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array('$ds-events-entries-by-tag');
		}

		public function about() {
			return array(
				'name' => 'Locations: DS events entries by tag',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://atheycreek',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.2',
				'release-date' => '2013-07-03T17:53:17+00:00'
			);
		}

		public function getSource() {
			return '5';
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
