<?php

require_once(TOOLKIT . '/class.datasource.php');
require_once(TOOLKIT . '/class.entrymanager.php');


Class datasourcetwitter_search extends Datasource{

	public $dsParamROOTELEMENT = 'twitter-search';

	public function __construct(&$parent, $env=NULL, $process_params=true){
		parent::__construct($parent, $env, $process_params);
	}

	public $dsParamCACHE = 300;

	public function about(){
		return array(
			'name' => 'Twitter: Search'
		);
	}

	public function grab(&$param_pool=NULL){
		require_once (EXTENSIONS . '/twitter_search/library/src/codebird.php');

		\Codebird\Codebird::setConsumerKey(
			Symphony::Configuration()->get('consumer_key','twitter_search'),
			Symphony::Configuration()->get('consumer_secret','twitter_search')
		);

		$cb = \Codebird\Codebird::getInstance();

		$cb->setToken(
			Symphony::Configuration()->get('access_token','twitter_search'),
			Symphony::Configuration()->get('access_secret','twitter_search')
		);

		$cb->setReturnFormat(CODEBIRD_RETURNFORMAT_ARRAY);

		$reply = (array) $cb->statuses_userTimeline('count=3');

		$el = new XMLElement($this->dsParamROOTELEMENT);
		General::array_to_xml($el, (array)$reply);
		return $el;
	}
}
