<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceevents_3_latest extends SectionDatasource {

		public $dsParamROOTELEMENT = 'events-3-latest';
		public $dsParamConditionalizer = '(if value of ({$pt1}) is ())';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '3';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'date';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		public $dsParamCACHE = '0';
		

		public $dsParamFILTERS = array(
				'35' => 'later than now',
				'213' => 'no',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'system:pagination',
				'name: unformatted',
				'date',
				'tags: tag: unformatted',
				'images: image'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about() {
			return array(
				'name' => 'Events: 3 latest',
				'author' => array(
					'name' => 'Brian Zerangue',
					'website' => 'http://churchdeploy.site',
					'email' => 'brian.zerangue@gmail.com'),
				'version' => 'Symphony 2.3.2',
				'release-date' => '2013-07-24T10:50:56+00:00'
			);
		}

		public function getSource() {
			return '6';
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
