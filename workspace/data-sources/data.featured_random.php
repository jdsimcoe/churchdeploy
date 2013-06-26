<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcefeatured_random extends SectionDatasource {

		public $dsParamROOTELEMENT = 'featured-random';
		public $dsParamORDER = 'random';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '1000';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:creation-date';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'262' => 'no',
				'264' => 'later than {$today}, {$today}',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'url',
				'image: image',
				'expiration'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about() {
			return array(
				'name' => 'Featured: Random',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://atheycreek-2',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3beta2',
				'release-date' => '2013-06-26T21:34:41+00:00'
			);
		}

		public function getSource() {
			return '28';
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
