<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceevents_recurring_entry_by_id extends Datasource{

		public $dsParamROOTELEMENT = 'events-recurring-entry-by-id';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$pt3';
		public $dsParamPARAMOUTPUT = 'verses';
		public $dsParamSORT = 'system:id';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'yes';

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
				'downloads: link',
				'images: image',
				'images: height',
				'images: color',
				'images: background',
				'text: content',
				'verses: passage',
				'member-role: member: first-name',
				'member-role: member: last-name',
				'member-role: member: photo',
				'member-role: member: email',
				'member-role: member: job-title',
				'member-role: member: phone-number',
				'member-role: member: anonymize',
				'childcare',
				'type: type'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Events: Recurring: Entry by ID',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://atheycreek',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2012-09-07T21:16:16+00:00'
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
