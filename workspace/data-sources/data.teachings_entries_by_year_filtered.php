<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceteachings_entries_by_year_filtered extends SectionDatasource {

		public $dsParamROOTELEMENT = 'teachings-entries-by-year-filtered';
		public $dsParamConditionalizer = '(if all of ((if value of ({$pt1}) is (teachings)), (if value of ({$pt2}) is (year))) is (yes))';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '{$pt5:10}';
		public $dsParamSTARTPAGE = '{$pt4:1}';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$pt3';
		public $dsParamSORT = 'date';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'109' => '{$pt3}-01-01 to {$pt3}-12-01-31',
				'216' => 'no',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'system:pagination',
				'title: unformatted',
				'slug',
				'filename',
				'current-id',
				'book',
				'chapter',
				'description: unformatted',
				'speaker: first-name',
				'speaker: last-name',
				'date',
				'tags: tag: unformatted'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about() {
			return array(
				'name' => 'Teachings: Entries by year (filtered)',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://atheycreek',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.2',
				'release-date' => '2013-08-01T20:33:16+00:00'
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
