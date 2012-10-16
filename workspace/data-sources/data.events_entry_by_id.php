<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceevents_entry_by_id extends Datasource{

		public $dsParamROOTELEMENT = 'events-entry-by-id';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamPARAMOUTPUT = 'verses';
		public $dsParamSORT = 'system:id';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'id' => '{$pt1},{$pt3}',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'name',
				'date',
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
				'member-role: member: first-name',
				'member-role: member: last-name',
				'member-role: member: photo',
				'member-role: member: email',
				'member-role: member: job-title',
				'member-role: member: phone-number',
				'member-role: member: anonymize',
				'member-role: role: role',
				'downloads: name',
				'downloads: file',
				'downloads: link',
				'childcare',
				'images: image',
				'images: height',
				'images: color',
				'images: background',
				'verses: passage'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Events: Entry by ID',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://atheycreek',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2012-09-07T21:15:59+00:00'
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
