<?php

	Class extension_language_redirect extends Extension{
		
		public function about(){
			return array(
				'name' => 'Language Redirect',
				'version' => '1.0.3',
				'release-date' => '2011-07-02',
				'author' => array(
								array(
									'name' => 'Jonas Coch',
									'website' => 'http://klaftertief.de',
									'email' => 'jonas@klaftertief.de'
								),
								array(
									'name' => 'Vlad Ghita',
									'email' => 'vlad_micutul@yahoo.com'
								)
				),
			);
		}

		public function getSubscribedDelegates(){
			return array(
						array(
							'page' => '/system/preferences/',
							'delegate' => 'AddCustomPreferenceFieldsets',
							'callback' => 'appendPreferences'
						),

						array(
							'page' => '/system/preferences/',
							'delegate' => 'Save',
							'callback' => '__SavePreferences'
						),
			);
		}
		
		public function appendPreferences($context){
			$group = new XMLElement('fieldset');
			$group->setAttribute('class', 'settings');
			$group->appendChild(new XMLElement('legend', __('Language Redirect')));

			$label = Widget::Label(__('Language codes'));
			$label->appendChild(Widget::Input('settings[language_redirect][language_codes]', General::Sanitize(Symphony::Configuration()->get('language_codes', 'language_redirect'))));

			$group->appendChild($label);

			$group->appendChild(new XMLElement('p', __('Comma separated list of supported language codes. First language ist the default language. Leave empty to disable <code>.htaccess</code>-rules.'), array('class' => 'help')));

			$context['wrapper']->appendChild($group);
		}

		public function __SavePreferences($context){
			$languageCodes = $_POST['settings']['language_redirect']['language_codes'];

			return self::__updateRewriteRules('edit', $languageCodes);
		}

		public function install(){
			return self::__updateRewriteRules('create');
		}

		public function enable(){
			$languageCodes = Symphony::Configuration()->get('language_codes', 'language_redirect');

			return self::__updateRewriteRules('edit', $languageCodes);
		}

		public function update($previousVersion){
			if (version_compare($previousVersion, '1.0', '<')) {
				$languageCodes = Symphony::Configuration()->get('languages', 'language_redirect');

				Symphony::Configuration()->remove('languages', 'language_redirect');
				Symphony::Configuration()->set('language_codes', $languageCodes, 'language_redirect');
				Administration::instance()->saveConfig();
			}

			return true;
		}

		public function disable(){
			return self::__updateRewriteRules('edit');
		}

		public function uninstall(){
			Symphony::Configuration()->remove('language_redirect');
			Administration::instance()->saveConfig();

			return self::__updateRewriteRules('remove');
		}

		private static function __updateRewriteRules($mode, $languageCodes = NULL){
			$htaccess = @file_get_contents(DOCROOT . '/.htaccess');

			if($htaccess === false) return false;

			switch ($mode) {
				case 'create':
						$htaccess = self::__createLanguageRules($htaccess);
					break;
				case 'edit':
						$htaccess = self::__editLanguageRules($htaccess, $languageCodes);
					break;
				case 'remove':
						$htaccess = self::__removeLanguageRules($htaccess);
					break;
			}

			return @file_put_contents(DOCROOT . '/.htaccess', $htaccess);
		}

		private static function __createLanguageRules($htaccess){
			$rule = "\t### LANGUAGE REDIRECT RULES start\n\t### no language codes set\n\t### LANGUAGE REDIRECT RULES end";

			## Remove existing rules
			$htaccess = self::__removeLanguageRules($htaccess);

			$htaccess = preg_replace('/(\s?### FRONTEND REWRITE)/', "{$rule}\n\n$1", $htaccess);

			return $htaccess;
		}

		private static function __editLanguageRules($htaccess, $languageCodes = NULL){
			## Cannot use $1 in a preg_replace replacement string, so using a token instead
			$token_language = md5('language');
			$token_region = md5('region');
			$token_symphony = md5('symphony-page');
		
			if (isset($languageCodes)) {
				$languageCodes = explode(',', $languageCodes);
				$languageCodes = array_map('trim', $languageCodes);

				$languages = array();
				$regions = array();
				foreach ($languageCodes as $languageCode) {
					$languages[] = substr($languageCode, 0, 2);
					$regions[] = substr(strrchr($languageCode, '-'), 1);
				}
				$languages = array_filter(array_unique($languages));
				$regions = array_filter(array_unique($regions));

				$languages = (is_array($languages) and !empty($languages)) ? implode('|', $languages) : NULL;
				$regions = (is_array($regions) and !empty($regions)) ? implode('|', $regions) : NULL;

				$rule = "\n\tRewriteCond %{REQUEST_FILENAME} !-d";
				$rule .= "\n\tRewriteCond %{REQUEST_FILENAME} !-f";
				$rule .= "\n\tRewriteRule ^({$languages})-?({$regions})?\/(.*\/?)$ index.php?language={$token_language}&region={$token_region}&symphony-page={$token_symphony}&%{QUERY_STRING} [L]";
			} else {
				$rule = "\n\t### no language codes set";
			}

			$htaccess = preg_replace('/(\s+### LANGUAGE REDIRECT RULES start)(.*?)(\s*### LANGUAGE REDIRECT RULES end)/s', "$1{$rule}$3", $htaccess);

			## Replace the token with the real value
			$htaccess = str_replace($token_language, '$1', $htaccess);
			$htaccess = str_replace($token_region, '$2', $htaccess);
			$htaccess = str_replace($token_symphony, '$3', $htaccess);

			return $htaccess;
		}

		private static function __removeLanguageRules($htaccess){
			return preg_replace('/\s+### LANGUAGE REDIRECT RULES start(.*?)### LANGUAGE REDIRECT RULES end/s', NULL, $htaccess);
		}

	}

