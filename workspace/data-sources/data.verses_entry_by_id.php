<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceverses_entry_by_id extends SectionDatasource {

		public $dsParamROOTELEMENT = 'verses-entry-by-id';
		public $dsParamConditionalizer = '(if value of ({$pt1}) is (events))';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamPARAMOUTPUT = array(
				'passage'
		);
		public $dsParamSORT = 'system:id';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'system:id' => '{$ds-events-entry-by-id-preview},{$ds-events-recurring-entry-by-id},{$ds-events-entry-by-id.verses}',
				'211' => 'no',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'passage'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array('$ds-events-entry-by-id-preview', '$ds-events-recurring-entry-by-id', '$ds-events-entry-by-id.verses');
		}

		public function about() {
			return array(
				'name' => 'Verses: Entry by ID',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://atheycreek.dev',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.3',
				'release-date' => '2013-09-19T17:18:13+00:00'
			);
		}

		public function getSource() {
			return '4';
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
