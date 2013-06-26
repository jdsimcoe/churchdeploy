<?php

	Class extension_export_ensemble extends Extension{

		public function getSubscribedDelegates(){
			return array(
				array(
					'page' => '/system/preferences/',
					'delegate' => 'AddCustomPreferenceFieldsets',
					'callback' => 'appendPreferences'
				)
			);
		}

		public function install(){
			if(!class_exists('ZipArchive')){
				if(isset(Administration::instance()->Page)){
					Administration::instance()->Page->pageAlert(__('Export Ensemble will not be able to download ZIP archives, since the "<a href="http://php.net/manual/en/book.zip.php">ZipArchive</a>" class is not available. To enable ZIP downloads, compile PHP with the <code>--enable-zip</code> flag.'), Alert::ERROR);
				}
			}
			return true;
		}

		public function appendPreferences($context){
			$no_zip_warning = null;
			$no_install_dir_message = null;
			$no_install_dir_warning = null;

			// Test whether the install directory exists
			if(!is_dir(DOCROOT . '/install/')){
				$no_install_dir_message = 'Export Ensemble is not able to create ensembles without a complete <code>install</code> directory. Please refer to the <code>README</code> file for usage instructions.';
				$no_install_dir_warning = ' <strong>Warning: It appears you do not have an <code>install</code> directory.</strong> ' . __($no_install_dir_message);
			}

			// If Export Ensemble button is pressed
			// Test whether the install directory exists
			if(isset($_POST['action']) && !is_dir(DOCROOT . '/install/')){
				Administration::instance()->Page->pageAlert(__($no_install_dir_message), Alert::ERROR);
			}
			else {
				// Download the ZIP file
				if(isset($_POST['action']['download-zip'])){
					if(class_exists('ZipArchive')){
						$this->__downloadZip();
					} else {
						Administration::instance()->Page->pageAlert(__('Export Ensemble is not able to download ZIP archives, since the "<a href="http://php.net/manual/en/book.zip.php">ZipArchive</a>" class is not available. To enable ZIP downloads, compile PHP with the <code>--enable-zip</code> flag. Try saving your install files instead and follow the README instructions.'), Alert::ERROR);
					}
				}

				// Save the install files
				if(isset($_POST['action']['save-install-files'])){
					$this->__saveInstallFiles();
				}
			}

			$group = new XMLElement('fieldset');
			$group->setAttribute('class', 'settings');
			$group->appendChild(new XMLElement('legend', __('Export Ensemble')));


			$div = new XMLElement('div', NULL, array('id' => 'file-actions', 'class' => 'label'));
			$span = new XMLElement('span', NULL, array('class' => 'frame'));

			$span->appendChild(new XMLElement('button', __('Save Install Files'), array('name' => 'action[save-install-files]', 'type' => 'submit')));

			if(!class_exists('ZipArchive')){
				$no_zip_warning = ' <strong>' . __('Warning: It appears you do not have the "ZipArchive" class available. To enable ZIP download, ensure that PHP is compiled with <code>--enable-zip</code>') . '</strong>';
			}
			else{
				$span->appendChild(new XMLElement('button', __('Download ZIP'), array('name' => 'action[download-zip]', 'type' => 'submit')));
			}

			$div->appendChild($span);

			$div->appendChild(new XMLElement('p', __('Save (overwrite) install files or package entire site as a <code>.zip</code> archive for download.' . $no_zip_warning . $no_install_dir_warning), array('class' => 'help')));

			$group->appendChild($div);
			$context['wrapper']->appendChild($group);
		}

		private function __downloadZip(){
			// Find table prefix used for this install of Symphony
			$tbl_prefix = Symphony::Configuration()->get('tbl_prefix', 'database');

			// Create arrays of tables to dump
			$db_tables = $this->__getDatabaseTables($tbl_prefix);
			$structure_tables = $this->__getStructureTables($db_tables);
			$data_tables = $this->__getDataTables($db_tables);

			// Perform SQL dumps
			require_once(dirname(__FILE__) . '/lib/class.mysqldump.php');
			$dump = new MySQLDump(Symphony::Database());
			$sql_schema = $this->__dumpSchema($dump, $structure_tables, $tbl_prefix);
			$sql_data = $this->__dumpData($dump, $data_tables, $tbl_prefix);

			// Create config_default.php file
			$config_template = $this->__createDefaultConfigFile();

			// Package ZIP archive
			$this->__createZipArchive($config_template, $sql_schema, $sql_data);
		}

		private function __saveInstallFiles(){
			// Find table prefix used for this install of Symphony
			$tbl_prefix = Symphony::Configuration()->get('tbl_prefix', 'database');

			// Create arrays of tables to dump
			$db_tables = $this->__getDatabaseTables($tbl_prefix);
			$structure_tables = $this->__getStructureTables($db_tables);
			$data_tables = $this->__getDataTables($db_tables);

			// Perform SQL dumps
			require_once(dirname(__FILE__) . '/lib/class.mysqldump.php');
			$dump = new MySQLDump(Symphony::Database());
			$sql_schema = $this->__dumpSchema($dump, $structure_tables, $tbl_prefix);
			$sql_data = $this->__dumpData($dump, $data_tables, $tbl_prefix);

			// Create config_template.php file
			$config_template = $this->__createDefaultConfigFile();

			// Write the install files
			if(FALSE !== @file_put_contents(DOCROOT . '/install/includes/install.sql', $sql_schema));
			else {
				Administration::instance()->Page->pageAlert(__('An error occurred while trying to write the <code>install.sql</code> file. Check the file permissions.'), Alert::ERROR);
				return;
			}
			if(FALSE !== @file_put_contents(DOCROOT . '/install/includes/config_default.php', $config_template));
			else {
				Administration::instance()->Page->pageAlert(__('An error occurred while trying to write the <code>config_default.php</code> file. Check the file permissions.'), Alert::ERROR);
				return;
			}
			if(FALSE !== @file_put_contents(DOCROOT . '/workspace/install.sql', $sql_data));
			else {
				Administration::instance()->Page->pageAlert(__('An error occurred while trying to write the <code>workspace/install.sql</code> file. Check the file permissions.'), Alert::ERROR);
				return;
			}

			Administration::instance()->Page->pageAlert(__('The install files were successfully saved.'), Alert::SUCCESS);
		}

		private function __getDatabaseTables($tbl_prefix){
			// Find all tables in the database
			$all_tables = Symphony::Database()->fetch('show tables');

			// Find length of prefix to test for table prefix
			$prefix_length = strlen($tbl_prefix);

			// Flatten multidimensional tables array
			$db_tables = array();
			foreach($all_tables as $table){
				$value = array_values($table);
				$value = $value[0];

				// Limit array of tables to those using the table prefix
				// and replace the table prefix with tbl
				if(substr($value, 0, $prefix_length) === $tbl_prefix){
					$db_tables[] = 'tbl_' . substr($value, $prefix_length);
				}
			}

			return $db_tables;
		}

		private function __getStructureTables($structure_tables){
			// Create array of tables to ignore for structure-only dump
			$ignore_tables = array(
				'tbl_entries_',
				'tbl_fields_'
			);

			// Remove tables from list for structure-only dump
			foreach($structure_tables as $index => $table){
				foreach($ignore_tables as $starts){
					if(substr($table, 0, strlen($starts)) === $starts ){
						unset($structure_tables[$index]);
					}
				}
			}

			// Add fields tables back into list
			$structure_tables[] = 'tbl_fields_%';
			sort($structure_tables);

			return $structure_tables;
		}

		private function __getDataTables($data_tables){
			// Create array of tables to ignore for data-only dump
			$ignore_tables = array(
				'tbl_authors',
				'tbl_cache',
				'tbl_entries_',
				'tbl_fields_',
				'tbl_forgotpass',
				'tbl_sessions'
			);

			// Remove tables from list for data-only dump
			foreach($data_tables as $index => $table){
				foreach($ignore_tables as $starts){
					if(substr($table, 0, strlen($starts)) === $starts ){
						unset($data_tables[$index]);
					}
				}
			}

			return $data_tables;
		}

		private function __dumpSchema($dump, $structure_tables, $tbl_prefix){
			// Create variables for the dump files
			$sql_schema = NULL;

			// Grab the schema
			foreach($structure_tables as $t) $sql_schema .= $dump->export($t, MySQLDump::STRUCTURE_ONLY);

			// Replace the current prefix with the default Symphony prefix
			$sql_schema = preg_replace(
				'/(DROP TABLE IF EXISTS|CREATE TABLE|INSERT INTO) `' . $tbl_prefix . '/i',
				'$1`tbl_', $sql_schema
			);

			// Remove any AUTO_INCREMENT counts
			$sql_schema = preg_replace('/AUTO_INCREMENT=\d+/i', NULL, $sql_schema);

			return $sql_schema;
		}

		private function __dumpData($dump, $data_tables, $tbl_prefix){
			// Create variables for the dump files
			$sql_data = NULL;

			// Field data and entry data schemas needs to be apart of the workspace sql dump
			$sql_data  = $dump->export('tbl_fields_%', MySQLDump::ALL);
			$sql_data .= $dump->export('tbl_entries_%', MySQLDump::ALL);

			// Grab the data
			foreach($data_tables as $t){
				$sql_data .= $dump->export($t, MySQLDump::DATA_ONLY);
			}

			// Replace the current prefix with the default Symphony prefix
			$sql_data = preg_replace(
				'/(DROP TABLE IF EXISTS|CREATE TABLE|INSERT INTO|STRUCTURE:|DATA:) `' . $tbl_prefix . '/i',
				'$1`tbl_', $sql_data
			);

			return $sql_data;
		}

		private function __createDefaultConfigFile(){
			$config = Symphony::Configuration()->get();

			Symphony::Configuration()->setArray($config);

			// Set defaults for database settings
			Symphony::Configuration()->set('host', 'localhost', 'database');
			Symphony::Configuration()->set('port', '3306', 'database');
			Symphony::Configuration()->set('user', '', 'database');
			Symphony::Configuration()->set('password', '', 'database');
			Symphony::Configuration()->set('db', '', 'database');
			Symphony::Configuration()->set('tbl_prefix', 'sym_', 'database');

			// Remove email settings
			Symphony::Configuration()->remove('email');
			Symphony::Configuration()->remove('email_sendmail');
			Symphony::Configuration()->remove('email_smtp');

			$config_settings = Symphony::Configuration()->__toString();
			$default_config = "<?php\n\t\$settings = " . $config_settings . ";\n";

			return $default_config;
		}

		private function __createZipArchive($config_template, $sql_schema, $sql_data){
			if (!is_writable(DOCROOT . '/manifest/tmp')) {
				Administration::instance()->Page->pageAlert(__('Check permissions for the /manifest/tmp directory.'), Alert::ERROR);
			}
			else {
				$archive = new ZipArchive;
				$res = $archive->open(TMP . '/ensemble.tmp.zip', ZipArchive::CREATE);

				if ($res === TRUE) {
					$this->__addFolderToArchive($archive, 'extensions', DOCROOT);
					$this->__addFolderToArchive($archive, 'symphony', DOCROOT);
					$this->__addFolderToArchive($archive, 'workspace', DOCROOT);
					$this->__addFolderToArchive($archive, 'install', DOCROOT);

					$archive->addFromString('install/includes/config_default.php', $config_template);
					$archive->addFromString('install/includes/install.sql', $sql_schema);
					$archive->addFromString('workspace/install.sql', $sql_data);

					$archive->addFile(DOCROOT . '/index.php', 'index.php');

					$readme_files = glob(DOCROOT . '/README.*');
					if(is_array($readme_files) && !empty($readme_files)){
						foreach($readme_files as $filename){
							$archive->addFile($filename, basename($filename));
						}
					}

					if(is_file(DOCROOT . '/README')) $archive->addFile(DOCROOT . '/README', 'README');
					if(is_file(DOCROOT . '/LICENCE')) $archive->addFile(DOCROOT . '/LICENCE', 'LICENCE');
					if(is_file(DOCROOT . '/update.php')) $archive->addFile(DOCROOT . '/update.php', 'update.php');

					// Remove logs
					$archive->deleteName('install/logs/install');
					$archive->deleteName('install/logs/update');
				}

				$archive->close();

				header('Content-type: application/octet-stream');
				header('Expires: ' . gmdate('D, d M Y H:i:s') . ' GMT');
				header(
					sprintf(
						'Content-disposition: attachment; filename=%s-ensemble.zip',
						Lang::createFilename(
							Symphony::Configuration()->get('sitename', 'general')
						)
					)
				);
				header('Pragma: no-cache');

				readfile(TMP . '/ensemble.tmp.zip');
				unlink(TMP . '/ensemble.tmp.zip');
				exit;
			}
		}

		private function __addFolderToArchive(&$archive, $path, $parent=NULL){
			$iterator = new DirectoryIterator($path);
			foreach($iterator as $file){
				if($file->isDot() || preg_match('/^\./', $file->getFilename())) continue;

				elseif($file->isDir()){
					$this->__addFolderToArchive($archive, $file->getPathname(), $parent);
				}

				else $archive->addFile($file->getPathname(), ltrim(str_replace($parent, NULL, $file->getPathname()), '/'));
			}
		}
	}
