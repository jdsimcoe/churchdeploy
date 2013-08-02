<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceteachings_entries_by_series_filtered extends SectionDatasource {

		public $dsParamROOTELEMENT = 'teachings-entries-by-series-filtered';
		public $dsParamConditionalizer = '(if value of ({$pt2}) is (series))';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$pt3';
		public $dsParamSORT = 'system:id';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'id' => '{$pt3}',
				'233' => 'no',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'teachings: title: unformatted',
				'teachings: slug',
				'teachings: filename',
				'teachings: current-id',
				'teachings: book',
				'teachings: chapter',
				'teachings: description: unformatted',
				'teachings: speaker: first-name',
				'teachings: speaker: last-name',
				'teachings: date',
				'teachings: video: url',
				'teachings: video: player',
				'teachings: video: id',
				'teachings: day',
				'teachings: tags: tag: unformatted'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about() {
			return array(
				'name' => 'Teachings: Entries by series (filtered)',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://atheycreek',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.2',
				'release-date' => '2013-08-01T19:51:11+00:00'
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
