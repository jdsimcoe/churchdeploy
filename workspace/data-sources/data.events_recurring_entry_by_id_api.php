<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceevents_recurring_entry_by_id_api extends Datasource{

		public $dsParamROOTELEMENT = 'events-recurring-entry-by-id-api';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$pt3';
		public $dsParamSORT = 'system:id';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'id' => '{$pt3}',
				'214' => 'no',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'name',
				'frequency',
				'description',
				'locations: name-formal',
				'locations: name-casual',
				'locations: description',
				'locations: address',
				'locations: city',
				'locations: state',
				'locations: zip',
				'locations: latitude',
				'locations: longitude',
				'downloads: name',
				'downloads: file',
				'images: image',
				'images: color',
				'text: content',
				'verses: passage',
				'verses: tags: description',
				'member-role: member: first-name',
				'member-role: member: last-name',
				'member-role: member: photo',
				'member-role: member: job-title',
				'childcare',
				'type: type'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Events: Recurring: Entry by ID (api)',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://atheycreekdev',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2012-09-01T15:59:49+00:00'
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
