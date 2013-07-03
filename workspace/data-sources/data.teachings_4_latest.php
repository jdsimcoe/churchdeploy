<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceteachings_4_latest extends SectionDatasource {

		public $dsParamROOTELEMENT = 'teachings-4-latest';
		public $dsParamConditionalizer = '(if value of ({$pt2}) is (teachings))';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '4';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'date';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		public $dsParamCACHE = '0';
		

		public $dsParamFILTERS = array(
				'216' => 'no',
				'280' => 'no',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
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
				'poster: image',
				'video: title',
				'video: description',
				'video: date',
				'video: url',
				'video: player',
				'video: id',
				'day',
				'featured'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about() {
			return array(
				'name' => 'Teachings: 4 latest',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://atheycreek',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.2',
				'release-date' => '2013-07-02T22:07:34+00:00'
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
