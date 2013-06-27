<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceteachings_entries_search extends SectionDatasource {

		public $dsParamROOTELEMENT = 'teachings-entries-search';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		public $dsParamCACHE = '120';
		

		public $dsParamFILTERS = array(
				'id' => '{$ds-search}',
				'216' => 'no',
				'280' => 'no',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'title: unformatted',
				'book',
				'chapter',
				'description: unformatted'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array('$ds-search');
		}

		public function about() {
			return array(
				'name' => 'Teachings: Entries: Search',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://atheycreek',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.2',
				'release-date' => '2013-06-27T23:03:49+00:00'
			);
		}

		public function getSource() {
			return '13';
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
