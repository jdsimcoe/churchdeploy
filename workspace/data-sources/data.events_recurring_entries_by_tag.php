<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceevents_recurring_entries_by_tag extends Datasource{

		public $dsParamROOTELEMENT = 'events-recurring-entries-by-tag';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'order';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'yes';

		public $dsParamFILTERS = array(
				'243' => '{$pt1:43}',
				'214' => 'no',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'system:pagination',
				'name',
				'frequency',
				'description',
				'locations: name-formal',
				'locations: name-casual'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Events: Recurring: Entries by tag',
				'author' => array(
					'name' => 'Kirk Strobeck',
					'website' => 'http://atheycreek.com',
					'email' => 'kirk@strobeck.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2012-09-01T21:02:26+00:00'
			);
		}

		public function getSource(){
			return '21';
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
