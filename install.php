<?php

	header('Expires: Mon, 12 Dec 1982 06:14:00 GMT');
	header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT');
	header('Cache-Control: no-cache, must-revalidate, max-age=0');
	header('Pragma: no-cache');

	function __errorHandler($errno=NULL, $errstr, $errfile=NULL, $errline=NULL, $errcontext=NULL){
		return;
	}

	if(!defined('PHP_VERSION_ID')){
    	$version = PHP_VERSION;
    	define('PHP_VERSION_ID', ($version{0} * 10000 + $version{2} * 100 + $version{4}));
	}

	if (PHP_VERSION_ID >= 50300){
	    error_reporting(E_ALL & ~E_NOTICE & ~E_DEPRECATED);
	}
	else{
	    error_reporting(E_ALL ^ E_NOTICE);
	}

	set_error_handler('__errorHandler');

	// Show PHP Info
	if(isset($_REQUEST['info'])){
		phpinfo();
		exit();
	}

	// Set the current timezone, should that not be available
	// default to GMT.
	if(!date_default_timezone_set(@date_default_timezone_get())) {
		date_default_timezone_set('GMT');
	}

	// Defines
	define('kVERSION', '2.2.5');
	define('kINSTALL_ASSET_LOCATION', './symphony/assets/installer');
	define('kINSTALL_FILENAME', basename(__FILE__));
	define('DOCROOT', rtrim(dirname(__FILE__), '\\/'));

	// Required system components
	require_once(DOCROOT . '/symphony/lib/boot/func.utilities.php');
	require_once(DOCROOT . '/symphony/lib/boot/defines.php');
	require_once(TOOLKIT . '/class.lang.php');
	require_once(TOOLKIT . '/class.general.php');
	require_once(CORE . '/class.errorhandler.php');

	// Initialize system language
	function setLanguage() {
		$lang = 'en';

		// Fetch language requests
		if(!empty($_REQUEST['lang'])){
			$lang = preg_replace('/[^a-zA-Z\-]/', NULL, $_REQUEST['lang']);
		}

		// Set language
		try{
			Lang::initialize();
			Lang::set($lang, false);
		}
		catch(Exception $s){
			return NULL;
		}

		return true;
	}

	/***********************
	         TESTS
	************************/

	// Check and set language
	if(setLanguage() === NULL){

		$code = '<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<title>' . __('Outstanding Requirements') . '</title>
		<link rel="stylesheet" type="text/css" href="' . kINSTALL_ASSET_LOCATION . '/main.css" />
		<script type="text/javascript" src="' . kINSTALL_ASSET_LOCATION . '/main.js"></script>
	</head>
		<body>
			<h1>' . __('Install Symphony') .  '<em>' . __('Version') . ' ' . kVERSION . '</em></h1>
			<h2>' . __('Outstanding Requirements') . '</h2>
			<p>' . __('Symphony needs at least one language file to be present before installation can proceed.') . '</p>

		</body>

</html>';

		die($code);

	}

	// Check for PHP 5.2+
	if(version_compare(phpversion(), '5.2', '<=')){

		$code = '<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<title>' . __('Outstanding Requirements') . '</title>
		<link rel="stylesheet" type="text/css" href="' . kINSTALL_ASSET_LOCATION . '/main.css" />
		<script type="text/javascript" src="' . kINSTALL_ASSET_LOCATION . '/main.js"></script>
	</head>
		<body>
			<h1>' . __('Install Symphony') .  '<em>' . __('Version') . ' ' . kVERSION . '</em></h1>
			<h2>' . __('Outstanding Requirements') . '</h2>
			<p>' . __('Symphony needs the following requirements satisfied before installation can proceed.') . '</p>

			<dl>
				<dt>' . __('%s 5.2 or above', array('<abbr title="PHP: Hypertext Pre-processor">PHP</abbr>')) . '</dt>
				<dd>' . __('Symphony needs a recent version of %s.', array('<abbr title="PHP: Hypertext Pre-processor">PHP</abbr>')) . '</dd>
			</dl>

		</body>

</html>';

		die($code);

	}

	// Make sure the install.sql file exists
	if(!file_exists('install.sql') || !is_readable('install.sql')){

		$code = '<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<title>' . __('Missing File') . '</title>
		<link rel="stylesheet" type="text/css" href="' . kINSTALL_ASSET_LOCATION . '/main.css" />
		<script type="text/javascript" src="' . kINSTALL_ASSET_LOCATION . '/main.js"></script>
	</head>
		<body>
			<h1>' . __('Install Symphony') .  '<em>' . __('Version') . ' ' . kVERSION . '</em></h1>
			<h2>' . __('Missing File') . '</h2>
			<p>' . __('It appears that <code>install.sql</code> is either missing or not readable. This is required to populate the database and must be uploaded before installation can commence. Ensure that <code>PHP</code> has read permissions.') . '</p>

		</body>

</html>';

		die($code);

	}

	// Check if Symphony is already installed
	if(file_exists('manifest/config.php')){

		$code = '<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<title>' . __('Existing Installation') . '</title>
		<link rel="stylesheet" type="text/css" href="' . kINSTALL_ASSET_LOCATION . '/main.css" />
		<script type="text/javascript" src="' . kINSTALL_ASSET_LOCATION . '/main.js"></script>
	</head>
		<body>
			<h1>' . __('Install Symphony') .  '<em>' . __('Version') . ' ' . kVERSION . '</em></h1>
			<h2>' . __('Existing Installation') . '</h2>
			<p>' . __('It appears that Symphony has already been installed at this location.') . '</p>

		</body>

</html>';

		die($code);

	}

	function getDynamicConfiguration(){

		$conf = array();

		$conf['admin']['max_upload_size'] = '5242880';
		$conf['symphony']['pagination_maximum_rows'] = '17';
		$conf['symphony']['allow_page_subscription'] = '1';
		$conf['symphony']['lang'] = 'en';
		$conf['symphony']['pages_table_nest_children'] = 'no';
		$conf['symphony']['strict_error_handling'] = 'yes';
		$conf['symphony']['session_gc_divisor'] = '10';
		$conf['symphony']['version'] = '2.2.5';
		$conf['log']['archive'] = '1';
		$conf['log']['maxsize'] = '102400';
		$conf['image']['cache'] = '1';
		$conf['image']['quality'] = '90';
		$conf['database']['character_set'] = 'utf8';
		$conf['database']['character_encoding'] = 'utf8';
		$conf['database']['runtime_character_set_alter'] = '1';
		$conf['database']['query_caching'] = 'on';
		$conf['public']['display_event_xml_in_source'] = 'no';
		$conf['general']['sitename'] = 'Anchor Church';
		$conf['region']['time_format'] = 'H:i';
		$conf['region']['date_format'] = 'd F Y';
		$conf['region']['datetime_separator'] = ' ';
		$conf['maintenance_mode']['enabled'] = 'no';
		$conf['members']['cookie-prefix'] = 'sym-members';
		$conf['members']['section'] = '1';
		$conf['members']['identity'] = '5';
		$conf['language_redirect']['language_codes'] = 'en';
		$conf['maptofront']['fallback'] = 'home';
		$conf['maptofront']['map_sub_to_front'] = 'yes';
		$conf['search_index']['re-index-per-page'] = '20';
		$conf['search_index']['re-index-refresh-rate'] = '0.5';
		$conf['search_index']['get-param-prefix'] = '';
		$conf['search_index']['get-param-keywords'] = 'keywords';
		$conf['search_index']['get-param-per-page'] = 'per-page';
		$conf['search_index']['get-param-sort'] = 'sort';
		$conf['search_index']['get-param-direction'] = 'direction';
		$conf['search_index']['get-param-sections'] = 'sections';
		$conf['search_index']['get-param-page'] = 'page';
		$conf['search_index']['default-sections'] = 'downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text';
		$conf['search_index']['default-per-page'] = '10';
		$conf['search_index']['default-sort'] = 'score';
		$conf['search_index']['default-direction'] = 'desc';
		$conf['search_index']['excerpt-length'] = '250';
		$conf['search_index']['min-word-length'] = '3';
		$conf['search_index']['max-word-length'] = '30';
		$conf['search_index']['stem-words'] = 'yes';
		$conf['search_index']['build-entries'] = 'yes';
		$conf['search_index']['mode'] = 'like';
		$conf['search_index']['log-keywords'] = 'yes';
		$conf['search_index']['indexes'] = 'a:9:{i:10;a:3:{s:6:"fields";a:3:{i:0;s:4:"name";i:1;s:4:"file";i:2;s:4:"tags";}s:9:"weighting";s:1:"2";s:7:"filters";a:1:{i:206;s:2:"no";}}i:6;a:3:{s:6:"fields";a:8:{i:0;s:4:"name";i:1;s:4:"date";i:2;s:11:"description";i:3;s:8:"location";i:4;s:11:"member-role";i:5;s:4:"tags";i:6;s:4:"type";i:7;s:9:"childcare";}s:9:"weighting";s:1:"2";s:7:"filters";a:1:{i:213;s:2:"no";}}i:21;a:3:{s:6:"fields";a:10:{i:0;s:4:"name";i:1;s:9:"frequency";i:2;s:11:"description";i:3;s:9:"locations";i:4;s:9:"downloads";i:5;s:4:"text";i:6;s:6:"verses";i:7;s:6:"events";i:8;s:11:"member-role";i:9;s:9:"childcare";}s:9:"weighting";s:1:"2";s:7:"filters";a:1:{i:214;s:2:"no";}}i:5;a:3:{s:6:"fields";N;s:9:"weighting";s:1:"2";s:7:"filters";a:1:{i:208;s:2:"no";}}i:3;a:3:{s:6:"fields";a:5:{i:0;s:3:"tag";i:1;s:11:"description";i:2;s:4:"slug";i:3;s:6:"parent";i:4;s:5:"order";}s:9:"weighting";s:1:"1";s:7:"filters";a:1:{i:57;s:2:"no";}}i:13;a:3:{s:6:"fields";a:15:{i:0;s:5:"title";i:1;s:4:"slug";i:2;s:8:"filename";i:3;s:10:"current-id";i:4;s:4:"book";i:5;s:7:"chapter";i:6;s:11:"description";i:7;s:7:"speaker";i:8;s:11:"member-role";i:9;s:4:"date";i:10;s:5:"video";i:11;s:3:"day";i:12;s:4:"tags";i:13;s:8:"featured";i:14;s:3:"seo";}s:9:"weighting";s:1:"2";s:7:"filters";a:1:{i:216;s:2:"no";}}i:27;a:3:{s:6:"fields";a:3:{i:0;s:5:"title";i:1;s:6:"poster";i:2;s:9:"teachings";}s:9:"weighting";s:1:"2";s:7:"filters";a:1:{i:233;s:2:"no";}}i:15;a:3:{s:6:"fields";a:2:{i:0;s:3:"tag";i:1;s:4:"hide";}s:9:"weighting";s:1:"2";s:7:"filters";a:1:{i:217;s:2:"no";}}i:7;a:3:{s:6:"fields";a:2:{i:0;s:7:"content";i:1;s:4:"tags";}s:9:"weighting";s:1:"2";s:7:"filters";a:1:{i:209;s:2:"no";}}}';
		$conf['search_index']['synonyms'] = 'a:8:{s:40:"3ac3d78a847fb9d566efa1f4a473a70e171a7622";a:2:{s:4:"word";s:7:"2 Peter";s:8:"synonyms";s:36:"second peter, secondpeter, 2nd peter";}s:40:"7bc12421ced5605a68d050d460c7c82fab5b20d8";a:2:{s:4:"word";s:9:"2nd peter";s:8:"synonyms";s:52:"2 Peter, second peter, secondpeter, 2Peter, 2ndPeter";}s:40:"b23a193872fc22386b943b59124e30963e802c52";a:2:{s:4:"word";s:8:"Meetings";s:8:"synonyms";s:62:"sundayserviceworship, recorded serviceworship, service worship";}s:40:"a7acb6fae59000aeab5e29ebf5dbe669c2044a45";a:2:{s:4:"word";s:10:"Revelation";s:8:"synonyms";s:75:"revelations, revelashuns, revelations, revalations, revelation study series";}s:40:"165ccd67438b50ac44bbfdf7b5208f9c115f12b2";a:2:{s:4:"word";s:18:"Women’s ministry";s:8:"synonyms";s:74:"womens ministry, wemons minisrty, womens ministry, wemons, wemons ministry";}s:40:"d2c6801d14d4acb51bcd8040b16a57eae602c516";a:2:{s:4:"word";s:9:"genealogy";s:8:"synonyms";s:9:"geneology";}s:40:"327c98604f85ba4098058cef24c148397a30208c";a:2:{s:4:"word";s:9:"teachings";s:8:"synonyms";s:7:"sermons";}s:40:"7ec262e585bc44c5101968023976342677b7d031";a:2:{s:4:"word";s:5:"Psalm";s:8:"synonyms";s:14:"psalms, pslams";}}';
		$conf['globalresourceloader']['ds-names'] = 'alerts_entries_by_tag,alerts_global,downloads_entries_by_tag,events_3_latest,events_all_entries_filtered,events_all_entries_past_filtered,events_entries_by_tag,events_entries_by_tag_related,events_entries_past_by_tag_related,events_recurring_all_entries_filtered,events_recurring_entries_by_tag,featured_random,images_entries_by_tag,images_toolkit_all_entries_filtered,layouts_default,layouts_ds_tags_entries_by_tag,locations_entries_by_tag,misc_all_entries,search,search_suggestions,status_all_entries,tags_all_entries,tags_entries_by_tag,teachings_4_latest,teachings_6_latest,teachings_entries_by_series_filtered,teachings_entries_by_year_filtered,teachings_entry_by_book_filtered,teachings_entry_by_id,teachings_entry_by_tag_filtered,teachings_featured_filtered,teachings_series_entries_filtered,teachings_series_home_filtered,teachings_tags_random_filtered,text_entries_by_tag,twitter_latest_entry,verses_entry_by_id,verses_entry_by_tag,xml_apibibliacom,xml_books_of_the_bible';
		$conf['cachelite']['lifetime'] = '86400';
		$conf['cachelite']['show-comments'] = 'no';
		$conf['cachelite']['backend-delegates'] = 'yes';

		return $conf;

	}

	function getTableSchema(){
		return file_get_contents('install.sql');
	}

	function getWorkspaceData(){
		return file_get_contents('workspace/install.sql');
	}

	define('INSTALL_REQUIREMENTS_PASSED', true);
	include_once('./symphony/lib/toolkit/include.install.php');
