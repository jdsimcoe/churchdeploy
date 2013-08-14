<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcefeatured_teachings extends SectionDatasource {

		public $dsParamROOTELEMENT = 'featured-teachings';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamPARAMOUTPUT = array(
				'video-podcast'
		);
		public $dsParamSORT = 'system:id';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'192' => 'yes',
				'216' => 'no',
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
				'video: thumbnail',
				'video: id',
				'day',
				'tags: tag: formatted',
				'video-podcast'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about() {
			return array(
				'name' => 'Featured: Teachings',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://atheycreek.dev',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.2',
				'release-date' => '2013-08-14T14:39:49+00:00'
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
