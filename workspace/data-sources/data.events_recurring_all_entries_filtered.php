<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceevents_recurring_all_entries_filtered extends SectionDatasource {

		public $dsParamROOTELEMENT = 'events-recurring-all-entries-filtered';
		public $dsParamConditionalizer = '(if any of ((if value of ({$pt2}) is (meetings)), (if value of ({$pt2}) is (events))) is (yes)) ';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'order';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'yes';
		public $dsParamCACHE = '0';
		

		public $dsParamFILTERS = array(
				'214' => 'no',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'system:pagination',
				'name: unformatted',
				'frequency: unformatted',
				'downloads: file',
				'images: image',
				'images: position',
				'images: height',
				'images: color',
				'verses: passage',
				'type: type: unformatted'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about() {
			return array(
				'name' => 'Events: Recurring: All entries (filtered)',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://atheycreek',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.2',
				'release-date' => '2013-07-02T22:57:21+00:00'
			);
		}

		public function getSource() {
			return '21';
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
