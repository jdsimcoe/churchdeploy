<?php

	Class extension_selectbox_link_field extends Extension{

		public function install(){
			try{
				Symphony::Database()->query("
					CREATE TABLE IF NOT EXISTS `tbl_fields_selectbox_link` (
						`id` int(11) unsigned NOT NULL auto_increment,
						`field_id` int(11) unsigned NOT NULL,
						`allow_multiple_selection` enum('yes','no') NOT NULL default 'no',
						`show_association` enum('yes','no') NOT NULL default 'yes',
						`hide_when_prepopulated` enum('yes','no') NOT NULL default 'no',
						`related_field_id` VARCHAR(255) NOT NULL,
						`limit` int(4) unsigned NOT NULL default '20',
						PRIMARY KEY  (`id`),
						KEY `field_id` (`field_id`)
					) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
				");
			}
			catch(Exception $e){
				return false;
			}

			return true;
		}

		public function uninstall(){
			if(parent::uninstall() == true){
				Symphony::Database()->query("DROP TABLE `tbl_fields_selectbox_link`");
				return true;
			}

			return false;
		}

		public function update($previousVersion = false){
			try{
				if(version_compare($previousVersion, '1.27', '<')){
					Symphony::Database()->query(
						"ALTER TABLE `tbl_fields_selectbox_link` ADD `hide_when_prepopulated` ENUM('yes','no') DEFAULT 'no'"
					);
				}
			}
			catch(Exception $e){
				// Discard
			}

			try{
				if(version_compare($previousVersion, '1.6', '<')){
					Symphony::Database()->query(
						"ALTER TABLE `tbl_fields_selectbox_link` ADD `limit` INT(4) UNSIGNED NOT NULL DEFAULT '20'"
					);
				}
			}
			catch(Exception $e){
				// Discard
			}

			if(version_compare($previousVersion, '1.15', '<')){
				try{
					$fields = Symphony::Database()->fetchCol('field_id',
						"SELECT `field_id` FROM `tbl_fields_selectbox_link`"
					);
				}
				catch(Exception $e){
					// Discard
				}

				if(is_array($fields) && !empty($fields)){
					foreach($fields as $field_id){
						try{
							Symphony::Database()->query(
								"ALTER TABLE `tbl_entries_data_{$field_id}`
								CHANGE `relation_id` `relation_id` INT(11) UNSIGNED NULL DEFAULT NULL"
							);
						}
						catch(Exception $e){
							// Discard
						}
					}
				}
			}

			try{
				Symphony::Database()->query("ALTER TABLE `tbl_fields_selectbox_link` CHANGE `related_field_id` `related_field_id` VARCHAR(255) NOT NULL");
			}
			catch(Exception $e){
				// Discard
			}

			if(version_compare($previousVersion, '1.19', '<')){
				try{
					Symphony::Database()->query("ALTER TABLE `tbl_fields_selectbox_link` ADD COLUMN `show_association` enum('yes','no') NOT NULL default 'yes'");
				}
				catch(Exception $e){
					// Discard
				}
			}

			return true;
		}
	}
