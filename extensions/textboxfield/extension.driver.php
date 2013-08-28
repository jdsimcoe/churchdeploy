<?php

	/**
	 * @package textboxfield
	 */

	/**
	 * An enhanced text input field.
	 */
	class Extension_TextBoxField extends Extension {
		/**
		 * The name of the field settings table.
		 */
		const FIELD_TABLE = 'tbl_fields_textbox';

		/**
		 * Publish page headers.
		 */
		const PUBLISH_HEADERS = 1;

		/**
		 * Datasource filter page headers.
		 */
		const FILTER_HEADERS = 2;

		/**
		 * What headers have been appended?
		 *
		 * @var integer
		 */
		static protected $appendedHeaders = 0;

		/**
		 * Add headers to the page.
		 */
		static public function appendHeaders($type) {
			if (
				(self::$appendedHeaders & $type) !== $type
				&& class_exists('Administration')
				&& Administration::instance() instanceof Administration
				&& Administration::instance()->Page instanceof HTMLPage
			) {
				$page = Administration::instance()->Page;

				if ($type === self::PUBLISH_HEADERS) {
					$page->addStylesheetToHead(URL . '/extensions/textboxfield/assets/textboxfield.publish.css', 'screen', null, false);
					$page->addScriptToHead(URL . '/extensions/textboxfield/assets/textboxfield.publish.js', null, false);
				}

				if ($type === self::FILTER_HEADERS) {
					$page->addStylesheetToHead(URL . '/extensions/textboxfield/assets/textboxfield.datasources.css', 'screen', null, false);
					$page->addScriptToHead(URL . '/extensions/textboxfield/assets/textboxfield.datasources.js', null, false);
				}

				self::$appendedHeaders &= $type;
			}
		}

		/**
		 * Create tables and configuration.
		 *
		 * @return boolean
		 */
		public function install() {
			Symphony::Database()->query(sprintf("
				CREATE TABLE IF NOT EXISTS `%s` (
					`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
					`field_id` INT(11) UNSIGNED NOT NULL,
					`column_length` INT(11) UNSIGNED DEFAULT 75,
					`text_size` ENUM('single', 'small', 'medium', 'large', 'huge') DEFAULT 'medium',
					`text_formatter` VARCHAR(255) DEFAULT NULL,
					`text_validator` VARCHAR(255) DEFAULT NULL,
					`text_length` INT(11) UNSIGNED DEFAULT 0,
					`text_cdata` ENUM('yes', 'no') DEFAULT 'no',
					`text_handle` ENUM('yes', 'no') DEFAULT 'no',
					PRIMARY KEY (`id`),
					KEY `field_id` (`field_id`)
				) ENGINE=MyISAM DEFAULT CHARSET=utf8;",
				self::FIELD_TABLE
			));

			return true;
		}

		/**
		 * Cleanup installation.
		 *
		 * @return boolean
		 */
		public function uninstall() {
			Symphony::Database()->query(sprintf(
				"DROP TABLE `%s`",
				self::FIELD_TABLE
			));

			return true;
		}

		/**
		 * Update extension from previous releases.
		 *
		 * @see toolkit.ExtensionManager#update()
		 * @param string $previousVersion
		 * @return boolean
		 */
		public function update($previousVersion=false) {
			// Column length:
			if ($this->updateHasColumn('show_full')) {
				$this->updateRemoveColumn('show_full');
			}

			if (!$this->updateHasColumn('column_length')) {
				$this->updateAddColumn('column_length', 'INT(11) UNSIGNED DEFAULT 75 AFTER `field_id`');
			}

			// Text size:
			if ($this->updateHasColumn('size')) {
				$this->updateRenameColumn('size', 'text_size');
			}

			// Text formatter:
			if ($this->updateHasColumn('formatter')) {
				$this->updateRenameColumn('formatter', 'text_formatter');
			}

			// Text validator:
			if ($this->updateHasColumn('validator')) {
				$this->updateRenameColumn('validator', 'text_validator');
			}

			// Text length:
			if ($this->updateHasColumn('length')) {
				$this->updateRenameColumn('length', 'text_length');
			}

			else if (!$this->updateHasColumn('text_length')) {
				$this->updateAddColumn('text_length', 'INT(11) UNSIGNED DEFAULT 0 AFTER `text_formatter`');
			}

			// Text CDATA:
			if (!$this->updateHasColumn('text_cdata')) {
				$this->updateAddColumn('text_cdata', "ENUM('yes', 'no') DEFAULT 'no' AFTER `text_length`");
			}

			// Text handle:
			if (!$this->updateHasColumn('text_handle')) {
				$this->updateAddColumn('text_handle', "ENUM('yes', 'no') DEFAULT 'no' AFTER `text_cdata`");
			}

			// Add handle index to textbox entry tables:
			require_once TOOLKIT . '/class.fieldmanager.php';
			$textbox_fields = FieldManager::fetch(null, null, 'ASC', 'sortorder', 'textbox');
			foreach($textbox_fields as $field) {
				$table = "tbl_entries_data_" . $field->get('id');
				if(!$this->updateHasIndex('handle', $table)) {
					$this->updateAddIndex('handle', $table);
				}
			}

			return true;
		}

		/**
		 * Add a new Index. Note that this does not check to see if an
		 * index already exists.
		 *
		 * @param string $index
		 * @param string $table
		 * @return boolean
		 */
		public function updateAddIndex($index, $table) {
			return Symphony::Database()->query("
				ALTER TABLE
					`$table`
				ADD INDEX
					`{$index}` (`{$index}`)
			");
		}

		/**
		 * Check if the given `$table` has the `$index`.
		 *
		 * @param string $index
		 * @param string $table
		 * @return boolean
		 */
		public function updateHasIndex($index, $table) {
			return (boolean)Symphony::Database()->fetchVar(
				'Key_name', 0,
				"
					SHOW INDEX FROM
						`$table`
					WHERE
						Key_name = '{$index}'
				"
			);
		}

		/**
		 * Add a new column to the settings table.
		 *
		 * @param string $column
		 * @param string $type
		 * @return boolean
		 */
		public function updateAddColumn($column, $type, $table = self::FIELD_TABLE) {
			return Symphony::Database()->query(sprintf("
				ALTER TABLE
					`%s`
				ADD COLUMN
					`{$column}` {$type}
				",
				$table
			));
		}

		/**
		 * Does the settings table have a column?
		 *
		 * @param string $column
		 * @return boolean
		 */
		public function updateHasColumn($column, $table = self::FIELD_TABLE) {
			return (boolean)Symphony::Database()->fetchVar('Field', 0, sprintf("
					SHOW COLUMNS FROM
						`%s`
					WHERE
						Field = '{$column}'
				",
				$table
			));
		}

		/**
		 * Remove a column from the settings table.
		 *
		 * @param string $column
		 * @return boolean
		 */
		public function updateRemoveColumn($column, $table = self::FIELD_TABLE) {
			return Symphony::Database()->query(sprintf("
				ALTER TABLE
					`%s`
				DROP COLUMN
					`{$column}`
				",
				$table
			));
		}

		/**
		 * Rename a column in the settings table.
		 *
		 * @param string $column
		 * @return boolean
		 */
		public function updateRenameColumn($from, $to, $table = self::FIELD_TABLE) {
			$data = Symphony::Database()->fetchRow(0, sprintf("
					SHOW COLUMNS FROM
						`%s`
					WHERE
						Field = '{$from}'
				",
				$table
			));

			if (!is_null($data['Default'])) {
				$type = 'DEFAULT ' . var_export($data['Default'], true);
			}

			else if ($data['Null'] == 'YES') {
				$type .= 'DEFAULT NULL';
			}

			else {
				$type .= 'NOT NULL';
			}

			return Symphony::Database()->query(sprintf("
				ALTER TABLE
					`%s`
				CHANGE
					`%s` `%s` %s
				",
				$table, $from, $to,
				$data['Type'] . ' ' . $type
			));
		}
	}