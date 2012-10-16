<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceteachings_entry_by_tag_filtered extends Datasource{

		public $dsParamROOTELEMENT = 'teachings-entry-by-tag-filtered';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '{$pt6:10}';
		public $dsParamSTARTPAGE = '{$pt5:1}';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$pt4';
		public $dsParamSORT = 'system:id';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'124' => '{$pt4}',
				'216' => 'no',
				'118' => '(if all of ((if value of ({$pt2}) is (teachings)), (if value of ({$pt3}) is (tag))) is (yes))',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'system:pagination',
				'title',
				'slug',
				'filename',
				'current-id',
				'book',
				'chapter',
				'description',
				'speaker: first-name',
				'speaker: last-name',
				'date',
				'poster',
				'video: url',
				'video: player',
				'video: id',
				'day',
				'tags: tag'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Teachings: Entry by tag (filtered)',
				'author' => array(
					'name' => 'Kirk Strobeck',
					'website' => 'http://72.10.33.203',
					'email' => 'kirk@strobeck.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2012-05-29T09:56:22+00:00'
			);
		}

		public function getSource(){
			return '13';
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
