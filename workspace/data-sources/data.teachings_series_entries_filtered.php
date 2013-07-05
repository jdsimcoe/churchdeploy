<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceteachings_series_entries_filtered extends SectionDatasource {

		public $dsParamROOTELEMENT = 'teachings-series-entries-filtered';
		public $dsParamConditionalizer = '(if any of ((if value of ({$pt1}) is ()), (if value of ({$pt2}) is (teachings))) is (yes))';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '4';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'order';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'yes';
		public $dsParamCACHE = '0';
		

		public $dsParamFILTERS = array(
				'268' => 'no',
				'233' => 'no',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'title: unformatted',
				'poster: image',
				'teachings: slug',
				'teachings: filename',
				'teachings: current-id',
				'teachings: book',
				'teachings: chapter',
				'teachings: speaker: first-name',
				'teachings: speaker: last-name',
				'teachings: date',
				'teachings: video: title',
				'teachings: video: description',
				'teachings: video: date',
				'teachings: video: url',
				'teachings: video: player',
				'teachings: day'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about() {
			return array(
				'name' => 'Teachings: Series: Entries (filtered)',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://atheycreek',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.2',
				'release-date' => '2013-07-04T15:59:39+00:00'
			);
		}

		public function getSource() {
			return '27';
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
