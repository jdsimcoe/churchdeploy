<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcesystem_authors extends Datasource{

		public $dsParamROOTELEMENT = 'system-authors';
		public $dsParamORDER = 'desc';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'id';

		

		public $dsParamINCLUDEDELEMENTS = array(
				'username',
				'name'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'System: Authors',
				'author' => array(
					'name' => 'Kirk Strobeck',
					'website' => 'http://anchorchurch',
					'email' => 'kirk@strobeck.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2013-02-03T11:06:23+00:00'
			);
		}

		public function getSource(){
			return 'authors';
		}

		public function allowEditorToParse(){
			return true;
		}

		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				include(TOOLKIT . '/data-sources/datasource.author.php');
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
