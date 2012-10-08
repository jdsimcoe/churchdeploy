<?php
	Class extension_filterField extends Extension{
	
		public function about() {
			return array('name' => __('Field: Filter'),
						 'version' => '1.1',
						 'release-date' => '2011-04-25',
						 'author' => array('name' => 'Marcin Konicki',
										   'website' => 'http://ahwayakchih.neoni.net',
										   'email' => 'ahwayakchih@neoni.net'),
						 'description' => __('Allows to filter data sources and this field values with expressions and parameters.')
			);
		}

		public function uninstall() {
			return Symphony::Database()->query("DROP TABLE `tbl_fields_filter`");
		}
		
		public function update($previousVersion) {
			// Update 1.0 installations
			if (version_compare($previousVersion, '1.1', '<')) {
				$fields = Symphony::Database()->fetchCol('field_id', 'SELECT f.field_id FROM `tbl_fields_filter` AS f');
				if (!empty($fields)) {
					foreach ($fields as $id) {
						Symphony::Database()->query("ALTER TABLE `tbl_entries_data_{$id}` ADD `value` enum('yes','no') DEFAULT 'yes'");
					}
				}
				Symphony::Database()->query("ALTER TABLE `tbl_fields_filter` ADD `filter_publish_errors` enum('yes','no') DEFAULT 'no'");
			}

			return true;
		}

		public function install() {
			return Symphony::Database()->query("CREATE TABLE IF NOT EXISTS `tbl_fields_filter` (
				`id` int(11) unsigned NOT NULL auto_increment,
				`field_id` int(11) unsigned NOT NULL,
				`filter_publish` TEXT default '',
				`filter_publish_errors` enum('yes','no') NOT NULL default 'no',
				`filter_datasource` enum('yes','no') NOT NULL default 'no',
				PRIMARY KEY  (`id`),
				KEY `field_id` (`field_id`)
			)");
		}

	}

