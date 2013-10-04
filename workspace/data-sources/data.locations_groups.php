<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcelocations_groups extends SectionDatasource {

		public $dsParamROOTELEMENT = 'locations-groups';
		public $dsParamConditionalizer = '(if value of ({$pt1}) is (home-groups))';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'city';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'286' => 'yes',
				'208' => 'no',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'name-group: unformatted',
				'name-formal: unformatted',
				'name-casual: unformatted',
				'frequency: unformatted',
				'description: formatted',
				'alert: unformatted',
				'address',
				'city',
				'state',
				'zip',
				'latitude',
				'longitude',
				'tags: tag: unformatted',
				'leaders: member: first-name',
				'leaders: member: last-name',
				'leaders: member: photo',
				'leaders: member: email',
				'leaders: member: job-title: unformatted',
				'leaders: member: phone-number',
				'leaders: member: hide',
				'leaders: role: role: unformatted',
				'leaders: role: context: unformatted',
				'leaders: role: description: unformatted',
				'new',
				'full',
				'childcare'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about() {
			return array(
				'name' => 'Locations: Groups',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://atheycreek.dev',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.3',
				'release-date' => '2013-10-04T22:09:52+00:00'
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
				$result->appendChild(new XMLElement('error', $e->getMessage() . ' on ' . $e->getLine() . ' of file ' . $e->getFile()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			return $result;
		}

	}
