<?php
class Extension_Twitter_Search extends Extension {
	public function install() {
		Symphony::Configuration()->set('consumer_key','KEY','twitter_search');
		Symphony::Configuration()->set('consumer_secret','SECRET','twitter_search');
		return Symphony::Configuration()->write();
	}
}