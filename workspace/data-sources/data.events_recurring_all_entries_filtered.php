<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceevents_recurring_all_entries_filtered extends Datasource{

		public $dsParamROOTELEMENT = 'events-recurring-all-entries-filtered';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'order';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'yes';

		public $dsParamFILTERS = array(
				'214' => 'no',
				'245' => '(if any of ((if value of ({$pt2}) is (meetings)), (if value of ({$pt2}) is (events))) is (yes)) ',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'system:pagination',
				'name',
				'frequency',
				'locations: name-formal',
				'locations: name-casual',
				'downloads: name',
				'downloads: file',
				'images: image',
				'images: caption',
				'images: position',
				'images: height',
				'images: color',
				'text: content',
				'verses: passage',
				'verses: tags: description'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Events: Recurring: All entries (filtered)',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://atheycreekdev',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2012-09-01T16:08:02+00:00'
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
