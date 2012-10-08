<?php

	if(!defined('__IN_SYMPHONY__')) die('<h2>Error</h2><p>You cannot directly access this file</p>');
	
	Class LanguageRedirect{
		
		private static $_instance;
		
		private $_language;
		private $_region;
		private $_language_code;
		private $_supported_language_codes;
		
		// I don't know those languages, so if You know for sure that browser uses different code,
		// or that native name should be different, please let me know about that :).
		// It would also be great, if whole string could be in native form, including name of country.
		private $_languages = array(					// [English name]
			'ab' => 'аҧсуа бызшәа',					// Abkhazian
			'af' => 'Afrikaans',					// Afrikaans
			'sq' => 'shqip',						// Albanian
			'am' => 'አማርኛ',							// Amharic
			'ar-dz' => 'العربية (Algeria)',			// Arabic
			'ar-bh' => 'العربية (Bahrain)',			// Arabic
			'ar-eg' => 'العربية (Egypt)',			// Arabic
			'ar-iq' => 'العربية (Iraq)',			// Arabic
			'ar-jo' => 'العربية (Jordan)',			// Arabic
			'ar-kw' => 'العربية (Kuwait)',			// Arabic
			'ar-lb' => 'العربية (Lebanon)',			// Arabic
			'ar-ly' => 'العربية (Libya)',			// Arabic
			'ar-ma' => 'العربية (Morocco)',			// Arabic
			'ar-om' => 'العربية (Oman)',			// Arabic
			'ar-qa' => 'العربية (Qatar)',			// Arabic
			'ar-sa' => 'العربية (Saudi Arabia)',	// Arabic
			'ar-sy' => 'العربية (Syria)',			// Arabic
			'ar-tn' => 'العربية (Tunisia)',			// Arabic
			'ar-ae' => 'العربية (U.A.E.)',			// Arabic
			'ar-ye' => 'العربية (Yemen)',			// Arabic
			'ar' => 'العربية',						// Arabic
			'hy' => 'Հայերեն',							// Armenian
			'as' => 'অসমীয়া',								// Assamese
			'az' => 'azərbaycan',					// Azeri
			'eu' => 'euskera',						// Basque
			'be' => 'Беларуская',					// Belarusian
			'bn' => 'বাংলা',								// Bengali
			'bg' => 'Български',					// Bulgarian
			'ca' => 'Català',						// Catalan
			'zh-cn' => '简体中文 (China)',					// Chinese simplified script
			'zh-hk' => '繁體中文 (Hong Kong SAR)',			// Chinese traditional script
			'zh-mo' => '繁體中文 (Macau SAR)',				// Chinese traditional script
			'zh-sg' => '简体中文 (Singapore)',				// Chinese simplified script
			'zh-tw' => '繁體中文 (Taiwan)',				// Chinese traditional script
			'zh' => '中文',							// Chinese
			'hr' => 'Hrvatski',						// Croatian
			'cs' => 'čeština',						// Czech
			'da' => 'Dansk',						// Danish
			'dv' => 'ދިވެހި',							// Divehi
			'nl-be' => 'Nederlands (Belgium)',		// Dutch
			'nl' => 'Nederlands (Netherlands)',		// Dutch
			'en-au' => 'English (Australia)',		// English
			'en-bz' => 'English (Belize)',			// English
			'en-ca' => 'English (Canada)',			// English
			'en-ie' => 'English (Ireland)',			// English
			'en-jm' => 'English (Jamaica)',			// English
			'en-nz' => 'English (New Zealand)',		// English
			'en-ph' => 'English (Philippines)',		// English
			'en-za' => 'English (South Africa)',	// English
			'en-tt' => 'English (Trinidad)',		// English
			'en-gb' => 'English (United Kingdom)',	// English
			'en-us' => 'English (United States)',	// English
			'en-zw' => 'English (Zimbabwe)',		// English
			'en' => 'English',						// English
			'ee' => 'Ɛʋɛ',							// Ewe
			'et' => 'Eesti',						// Estonian
			'fo' => 'føroyskt',						// Faeroese
			'fa' => 'فارسی',						// Farsi
			'fi' => 'suomi',						// Finnish
			'fr-be' => 'français (Belgium)',		// French (Belgium)
			'fr-ca' => 'français canadien',			// French (Canada)
			'fr-lu' => 'français (Luxembourg)',		// French
			'fr-mc' => 'français (Monaco)',			// French
			'fr-ch' => 'français (Switzerland)',	// French
			'fr' => 'français',						// French
			'ff' => 'Fulfulde, Pulaar, Pular',		// Fula, Fulah, Fulani
			'gl' => 'Galego',						// Galician
			'gd' => 'Gàidhlig',						// Gaelic (Scottish)
			'ga' => 'Gaeilge',						// Gaelic (Irish)
			'gv' => 'Gaelg',						// Gaelic (Manx) (Isle of Man)
			'ka' => 'ქართული ენა',						// Georgian
			'de-at' => 'Deutsch (Austria)',			// German
			'de-li' => 'Deutsch (Liechtenstein)',	// German
			'de-lu' => 'Deutsch (Luxembourg)',		// German
			'de-ch' => 'Deutsch (Switzerland)',		// German
			'de' => 'Deutsch',						// German
			'el' => 'Ελληνικά',						// Greek
			'gu' => 'ગુજરાતી',							// Gujarati
			'ha' => 'هَوْسَ',							// Hausa
			'he' => 'עברית',						// Hebrew
			'hi' => 'हिंदी',							// Hindi
			'hu' => 'Magyar',						// Hungarian
			'is' => 'Íslenska',						// Icelandic
			'id' => 'Bahasa Indonesia',				// Indonesian
			'it-ch' => 'italiano (Switzerland)',	// Italian
			'it' => 'italiano',						// Italian
			'ja' => '日本語',							// Japanese
			'kn' => 'ಕನ್ನಡ',							// Kannada
			'kk' => 'Қазақ',						// Kazakh
			'rw' => 'Kinyarwanda',					// Kinyarwanda
			'kok' => 'कोंकणी',							// Konkani
			'ko' => '한국어/조선말',							// Korean
			'kz' => 'Кыргыз',						// Kyrgyz
			'lv' => 'Latviešu',						// Latvian
			'lt' => 'Lietuviškai',					// Lithuanian
			'luo'=> 'Dholuo',						// Luo
			'ms' => 'Bahasa Melayu',				// Malay
			'mk' => 'Македонски',					// Macedonian
			'ml' => 'മലയാളം',								// Malayalam
			'mt' => 'Malti',						// Maltese
			'mr' => 'मराठी',							// Marathi
			'mn' => 'Монгол',						// Mongolian  (Cyrillic)
			'ne' => 'नेपाली',							// Nepali
			'nb-no' => 'Norsk bokmål',				// Norwegian Bokmål
			'nb' => 'Norsk bokmål',					// Norwegian Bokmål
			'nn-no' => 'Norsk nynorsk',				// Norwegian Nynorsk
			'nn' => 'Norsk nynorsk',				// Norwegian Nynorsk
			'no' => 'Norsk',						// Norwegian
			'or' => 'ଓଡ଼ିଆ',								// Oriya
			'ps' => 'پښتو',							// Pashto
			'pl' => 'polski',						// Polish
			'pt-br' => 'português brasileiro',		// Portuguese (Brasil)
			'pt' => 'português',					// Portuguese
			'pa' => 'پنجابی/ਪੰਜਾਬੀ',					// Punjabi
			'qu' => 'Runa Simi/Kichwa',				// Quechua
			'rm' => 'Romansch',						// Rhaeto-Romanic
			'ro-md' => 'Română (Moldova)',			// Romanian
			'ro' => 'Română',						// Romanian
			'rn' => 'kiRundi', 						// Rundi
			'ru-md' => 'Pyccĸий (Moldova)',			// Russian
			'ru' => 'Pyccĸий',						// Russian
			'sg' => 'yângâ tî sängö',				// Sango
			'sa' => 'संस्कृतम्',							// Sanskrit
			'sc' => 'sardu',						// Sardinian
			'sr' => 'Srpski/српски',				// Serbian
			'sn' => 'chiShona',						// Shona
			'ii' => 'ꆇꉙ',							// Sichuan Yi
			'si' => 'සිංහල',						// Sinhalese, Sinhala
			'sk' => 'Slovenčina',					// Slovak
			'ls' => 'Slovenščina',					// Slovenian
			'so' => 'Soomaaliga/af Soomaali',		// Somali
			'st' => 'Sesotho',						// Sotho, Sutu
			'es-ar' => 'Español (Argentina)',		// Spanish
			'es-bo' => 'Español (Bolivia)',			// Spanish
			'es-cl' => 'Español (Chile)',			// Spanish
			'es-co' => 'Español (Colombia)',		// Spanish
			'es-cr' => 'Español (Costa Rica)',		// Spanish
			'es-do' => 'Español (Dominican Republic)',// Spanish
			'es-ec' => 'Español (Ecuador)',			// Spanish
			'es-sv' => 'Español (El Salvador)',		// Spanish
			'es-gt' => 'Español (Guatemala)',		// Spanish
			'es-hn' => 'Español (Honduras)',		// Spanish
			'es-mx' => 'Español (Mexico)',			// Spanish
			'es-ni' => 'Español (Nicaragua)',		// Spanish
			'es-pa' => 'Español (Panama)',			// Spanish
			'es-py' => 'Español (Paraguay)',		// Spanish
			'es-pe' => 'Español (Peru)',			// Spanish
			'es-pr' => 'Español (Puerto Rico)',		// Spanish
			'es-us' => 'Español (United States)',	// Spanish
			'es-uy' => 'Español (Uruguay)',			// Spanish
			'es-ve' => 'Español (Venezuela)',		// Spanish
			'es' => 'Español',						// Spanish
			'sw' => 'kiswahili',					// Swahili
			'sv-fi' => 'svenska (Finland)',			// Swedish
			'sv' => 'svenska',						// Swedish
			'syr' => 'ܣܘܪܝܝܐ',						// Syriac
			'ta' => 'தமிழ்',							// Tamil
			'tt' => 'татарча/تاتارچا',				// Tatar
			'te' => 'తెలుగు',							// Telugu
			'th' => 'ภาษาไทย',						// Thai
			'ti' => 'ትግርኛ',							// Tigrinya
			'ts' => 'Xitsonga',						// Tsonga
			'tn' => 'Setswana',						// Tswana
			'tr' => 'Türkçe',						// Turkish
			'tk' => 'Түркмен',						// Turkmen
			'ug' => 'ئۇيغۇرچە‎/Uyƣurqə/Уйғурчә',		// Uighur, Uyghur
			'uk' => 'Українська',					// Ukrainian
			'ur' => 'اردو',							// Urdu
			'uz' => 'o\'zbek',						// Uzbek
			've' => 'Tshivenḓa',					// Venda
			'vi' => 'Tiếng Việt',					// Vietnamese
			'wa' => 'walon',						// Waloon
			'cy' => 'Cymraeg',						// Welsh
			'wo' => 'Wolof',						// Wolof
			'xh' => 'isiXhosa',						// Xhosa
			'yi' => 'ייִדיש',						// Yiddish
			'yo' => 'Yorùbá',						// Yoruba
			'zu' => 'isiZulu',						// Zulu
		);
		
		private function __construct(){
			$this->_language = General::sanitize($_REQUEST['language']);
			$this->_region = General::sanitize($_REQUEST['region']);
			$this->_language_code = $this->_region ? $this->_language.'-'.$this->_region : $this->_language;
			
			$supported_language_codes = explode(',', General::sanitize(Symphony::Configuration()->get('language_codes', 'language_redirect')));
			
			$this->_supported_language_codes = $this->cleanLanguageCodes($supported_language_codes);
		}
		
		public static function instance() {
			if (!self::$_instance) {self::$_instance = new self(); }
			
			return self::$_instance;
		}
		
		/**
		 * Get current language.
		 * 
		 * @return string
		 */
		public function getLanguage(){
			return $this->_language;
		}
		
		/**
		 * Get current region.
		 * 
		 * @return string
		 */
		public function getRegion(){
			return $this->_region;
		}
		
		/**
		 * Get current language code.
		 * 
		 * @return string
		 */
		public function getLanguageCode(){
			return $this->_language_code;
		}
		
		/**
		 * Get supported language codes.
		 * 
		 * @return array
		 */
		public function getSupportedLanguageCodes(){
			return $this->_supported_language_codes;
		}

		/**
		 * Return languages array.
		 */
		public function getAllLanguages(){
			return $this->_languages;
		}
		
		
		
		/*------------------------------------------------------------------------------------------------*/
		/*  Utilities  */
		/*------------------------------------------------------------------------------------------------*/
		public function cleanLanguageCodes($language_codes){
			$clean = array_map('trim', $language_codes);
			$clean = array_filter($clean);
			
			return $clean;
		}
	}
