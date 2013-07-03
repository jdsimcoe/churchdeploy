<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceteachings_entry_by_book_filtered extends SectionDatasource {

		public $dsParamROOTELEMENT = 'teachings-entry-by-book-filtered';
		public $dsParamConditionalizer = '(if all of ((if value of ({$pt2}) is (teachings)), (if value of ({$pt3}) is (book))) is (yes))';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '{$pt6:10}';
		public $dsParamSTARTPAGE = '{$pt5:1}';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$pt4';
		public $dsParamSORT = 'date';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		public $dsParamCACHE = '0';
		

		public $dsParamFILTERS = array(
				'111' => '{$pt4}',
				'216' => 'no',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'system:pagination',
				'slug',
				'filename',
				'current-id',
				'book',
				'chapter',
				'speaker: first-name',
				'speaker: last-name',
				'date',
				'poster: image',
				'video: url',
				'video: player',
				'video: id',
				'day'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about() {
			return array(
				'name' => 'Teachings: Entry by book (filtered)',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://atheycreek',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.2',
				'release-date' => '2013-07-02T22:36:41+00:00'
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
