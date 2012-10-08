<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceevents_all_entries_filtered extends Datasource{

		public $dsParamCACHE = 'null';
		public $dsParamROOTELEMENT = 'events-all-entries-filtered';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '{$pt4:5}';
		public $dsParamSTARTPAGE = '{$pt3:1}';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'date';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'35' => 'later than {$today}, {$today}',
				'169' => '(if value of ({$pt2}) is (events))',
				'213' => 'no',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'system:pagination',
				'name',
				'date',
				'description'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Events: All entries (filtered)',
				'author' => array(
					'name' => 'Kirk Strobeck',
					'website' => 'http://atheycreek.com',
					'email' => 'kirk@strobeck.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2012-07-04T17:35:26+00:00'
			);
		}

		public function getSource(){
			return '6';
		}

		public function allowEditorToParse(){
			return true;
		}

		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				include(TOOLKIT . '/data-sources/datasource.section.php');
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
