<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceteachings_entries_by_series_filtered extends Datasource{

		public $dsParamROOTELEMENT = 'teachings-entries-by-series-filtered';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$pt4';
		public $dsParamSORT = 'system:id';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'id' => '{$pt4}',
				'233' => 'no',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'teachings: title',
				'teachings: slug',
				'teachings: filename',
				'teachings: current-id',
				'teachings: book',
				'teachings: chapter',
				'teachings: description',
				'teachings: speaker: first-name',
				'teachings: speaker: last-name',
				'teachings: date',
				'teachings: video: url',
				'teachings: video: player',
				'teachings: video: id',
				'teachings: day',
				'teachings: tags: tag'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Teachings: Entries by series (filtered)',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://atheycreek',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2013-04-22T15:33:50+00:00'
			);
		}

		public function getSource(){
			return '27';
		}

		public function allowEditorToParse(){
			return true;
		}

		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				include(TOOLKIT . '/data-sources/datasource.section.php');
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
