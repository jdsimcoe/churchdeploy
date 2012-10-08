<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcelocations_entries_by_tag extends Datasource{

		public $dsParamROOTELEMENT = 'locations-entries-by-tag';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$pt1:43';
		public $dsParamSORT = 'system:id';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'142' => '{$pt1:43}',
				'208' => 'no',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'name-formal',
				'name-casual',
				'description',
				'address',
				'city',
				'state',
				'zip',
				'latitude',
				'longitude'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Locations: Entries by tag',
				'author' => array(
					'name' => 'Kirk Strobeck',
					'website' => 'http://72.10.33.203',
					'email' => 'kirk@strobeck.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2012-05-24T23:25:03+00:00'
			);
		}

		public function getSource(){
			return '5';
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
