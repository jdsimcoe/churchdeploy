<?php
	$settings = array(


		###### ADMIN ######
		'admin' => array(
			'max_upload_size' => '5242880',
		),
		########


		###### SYMPHONY ######
		'symphony' => array(
			'pagination_maximum_rows' => '99999',
			'lang' => 'en',
			'pages_table_nest_children' => 'no',
			'session_gc_divisor' => '10',
			'version' => '2.3.4',
			'cookie_prefix' => 'sym-',
			'association_maximum_rows' => '5',
		),
		########


		###### LOG ######
		'log' => array(
			'archive' => '1',
			'maxsize' => '102400',
		),
		########


		###### IMAGE ######
		'image' => array(
			'cache' => '1',
			'quality' => '90',
			'disable_regular_rules' => 'no',
			'disable_upscaling' => 'no',
		),
		########


		###### DATABASE ######
		'database' => array(
			'query_caching' => 'on',
			'host' => 'localhost',
			'port' => '3306',
			'user' => null,
			'password' => null,
			'db' => null,
			'tbl_prefix' => 'sym_',
		),
		########


		###### PUBLIC ######
		'public' => array(
			'display_event_xml_in_source' => 'no',
		),
		########


		###### GENERAL ######
		'general' => array(
			'useragent' => 'Symphony/2.3.4',
			'sitename' => 'Athey Creek Christian Fellowship',
		),
		########


		###### FILE ######
		'file' => array(
			'write_mode' => '0644',
		),
		########


		###### DIRECTORY ######
		'directory' => array(
			'write_mode' => '0755',
		),
		########


		###### REGION ######
		'region' => array(
			'time_format' => 'H:i',
			'date_format' => 'd F Y',
			'datetime_separator' => ' ',
			'timezone' => 'America/Los_Angeles',
		),
		########


		###### MAINTENANCE_MODE ######
		'maintenance_mode' => array(
			'enabled' => 'no',
		),
		########


		###### MEMBERS ######
		'members' => array(
			'cookie-prefix' => 'sym-members',
			'section' => '1',
			'identity' => '5',
		),
		########


		###### MAPTOFRONT ######
		'maptofront' => array(
			'fallback' => 'home',
			'map_sub_to_front' => 'yes',
		),
		########


		###### SEARCH_INDEX ######
		'search_index' => array(
			're-index-per-page' => '20',
			're-index-refresh-rate' => '0.5',
			'get-param-prefix' => null,
			'get-param-keywords' => 'keywords',
			'get-param-per-page' => 'per-page',
			'get-param-sort' => 'sort',
			'get-param-direction' => 'direction',
			'get-param-sections' => 'sections',
			'get-param-page' => 'page',
			'default-sections' => 'downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',
			'default-per-page' => '20',
			'default-sort' => 'score',
			'default-direction' => 'desc',
			'excerpt-length' => '250',
			'min-word-length' => '1',
			'max-word-length' => '255',
			'stem-words' => 'yes',
			'build-entries' => 'no',
			'mode' => 'like',
			'log-keywords' => 'yes',
			'indexes' => 'a:8:{i:10;a:3:{s:6:\"fields\";a:3:{i:0;s:4:\"name\";i:1;s:4:\"file\";i:2;s:4:\"tags\";}s:9:\"weighting\";s:1:\"2\";s:7:\"filters\";a:1:{i:206;s:2:\"no\";}}i:6;a:3:{s:6:\"fields\";a:4:{i:0;s:4:\"name\";i:1;s:4:\"date\";i:2;s:11:\"description\";i:3;s:9:\"locations\";}s:9:\"weighting\";s:1:\"2\";s:7:\"filters\";a:1:{i:213;s:2:\"no\";}}i:21;a:3:{s:6:\"fields\";a:4:{i:0;s:4:\"name\";i:1;s:9:\"frequency\";i:2;s:11:\"description\";i:3;s:9:\"locations\";}s:9:\"weighting\";s:1:\"2\";s:7:\"filters\";a:1:{i:214;s:2:\"no\";}}i:3;a:3:{s:6:\"fields\";a:3:{i:0;s:3:\"tag\";i:1;s:11:\"description\";i:2;s:6:\"parent\";}s:9:\"weighting\";s:1:\"2\";s:7:\"filters\";a:1:{i:57;s:2:\"no\";}}i:27;a:3:{s:6:\"fields\";a:1:{i:0;s:5:\"title\";}s:9:\"weighting\";s:1:\"1\";s:7:\"filters\";a:1:{i:233;s:2:\"no\";}}i:15;a:3:{s:6:\"fields\";a:1:{i:0;s:3:\"tag\";}s:9:\"weighting\";s:1:\"2\";s:7:\"filters\";a:1:{i:217;s:2:\"no\";}}i:7;a:3:{s:6:\"fields\";a:2:{i:0;s:7:\"content\";i:1;s:4:\"tags\";}s:9:\"weighting\";s:1:\"2\";s:7:\"filters\";a:1:{i:209;s:2:\"no\";}}i:13;a:3:{s:6:\"fields\";a:6:{i:0;s:5:\"title\";i:1;s:8:\"filename\";i:2;s:4:\"book\";i:3;s:7:\"chapter\";i:4;s:11:\"description\";i:5;s:7:\"speaker\";}s:9:\"weighting\";s:1:\"1\";s:7:\"filters\";a:2:{i:125;s:3:\"105\";i:216;s:2:\"no\";}}}',
			'synonyms' => 'a:0:{}',
		),
		########


		###### SORTING ######
		'sorting' => array(
			'section_members_sortby' => '4',
			'section_members_order' => 'desc',
			'section_misc_sortby' => '14',
			'section_misc_order' => 'asc',
			'section_tags_sortby' => '23',
			'section_tags_order' => 'asc',
			'section_locations_sortby' => '30',
			'section_locations_order' => 'asc',
			'section_verses_sortby' => '24',
			'section_verses_order' => 'asc',
			'section_events_sortby' => '35',
			'section_events_order' => 'desc',
			'section_text_sortby' => '201',
			'section_text_order' => 'asc',
			'section_images_sortby' => '46',
			'section_images_order' => 'desc',
			'section_sections_sortby' => '115',
			'section_sections_order' => 'asc',
			'section_downloads_sortby' => null,
			'section_downloads_order' => 'asc',
			'section_layouts_sortby' => '78',
			'section_layouts_order' => 'desc',
			'section_teachings_sortby' => '109',
			'section_teachings_order' => 'desc',
			'section_events-types_sortby' => null,
			'section_events-types_order' => 'asc',
			'section_teachings-tags_sortby' => '127',
			'section_teachings-tags_order' => 'asc',
			'section_members-roles-types_sortby' => '132',
			'section_members-roles-types_order' => 'asc',
			'section_members-roles_sortby' => '242',
			'section_members-roles_order' => 'asc',
			'section_videos_sortby' => '185',
			'section_videos_order' => 'desc',
			'section_events-recurring_sortby' => '244',
			'section_events-recurring_order' => 'asc',
			'section_twitter_sortby' => '194',
			'section_twitter_order' => 'desc',
			'section_status_sortby' => null,
			'section_status_order' => 'asc',
			'section_alerts_sortby' => null,
			'section_alerts_order' => 'asc',
			'section_teachings-series_sortby' => '240',
			'section_teachings-series_order' => 'asc',
			'section_featured_sortby' => '264',
			'section_featured_order' => 'asc',
		),
		########


		###### HTML5_DOCTYPE ######
		'html5_doctype' => array(
			'exclude_pagetypes' => null,
		),
		########


		###### TWITTER_SEARCH ######
		'twitter_search' => array(
			'consumer_key' => 'yC9KqWq71Qo1zyNUFbhpyg',
			'consumer_secret' => 'hYU647QU8zmhgRHVVx0wsUO9VIgdXQmuJJNWOf2pg',
			'bearer_token' => 'AAAAAAAAAAAAAAAAAAAAAC72SgAAAAAAE%2FYHwilwf2DRcCJwjgm%2BPGlDt6M%3DTYQjnIOksKE1hp9FPwJxsk0o4BYbp9e21qMRVg',
			'access_token' => '394456256-4c1XXgtifMnhDzvcvcYwRJ4gaacgtZglbvP2VjPg',
			'access_secret' => 'fxelWdiDzBl6mpQ1NvmKm7wPq9NNzw3YcFkP3AsNE8E',
		),
		########


		###### GLOBALRESOURCELOADER ######
		'globalresourceloader' => array(
			'ds-names' => 'layouts_default,layouts_ds_tags_entries_by_tag,misc_all_entries,status_all_entries,tags_all_entries,tags_filtered',
			'ds-pages' => '5,7,10',
		),
		########


		###### ELASTICSEARCH ######
		'elasticsearch' => array(
			'host' => 'http://127.0.0.1:9200/',
			'index-name' => 'athey-creek',
			'reindex-batch-size' => '20',
			'reindex-batch-delay' => '0',
			'per-page' => '20',
			'sort' => '_score',
			'direction' => 'desc',
			'highlight-fragment-size' => '200',
			'highlight-per-field' => '1',
			'build-entry-xml' => 'no',
			'default-sections' => null,
			'default-language' => null,
			'log-searches' => 'yes',
			'username' => 'atheycreek',
			'password' => '@th3yCr33k',
		),
		########


		###### DATETIME ######
		'datetime' => array(
			'english' => 'en, en_GB.UTF8, en_GB',
			'german' => 'de, de_DE.UTF8, de_DE',
		),
		########
	);
