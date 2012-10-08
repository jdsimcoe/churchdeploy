<?php
	
	require_once(TOOLKIT . '/class.administrationpage.php');
	
	Class ContentExtensionHealth_CheckDirectories extends AdministrationPage{
		
		public function __viewIndex() {		
			/* FETCH ALL ENTRIES WITH UPLOAD FIELDS */
			$extensionManager = new ExtensionManager($this->_Parent);
			if($extensionManager->fetchStatus('uniqueuploadfield') == EXTENSION_ENABLED) {
				$destinations = Symphony::Database()->fetch("SELECT destination COLLATE utf8_general_ci AS destination FROM tbl_fields_upload UNION ALL SELECT destination FROM tbl_fields_uniqueupload ORDER BY destination ASC");
			} else {
				$destinations = Symphony::Database()->fetch("SELECT destination FROM tbl_fields_upload ORDER BY destination ASC");
			}
			
			/* SET PAGE TYPE AND TITLE */
			$this->setPageType('index');
			$this->setTitle(__('Directory Health Check'));
			$this->appendSubheading(__('Health Check'));
			
			/* APPEND DIRECTORY CREATION BUTTONS IF APPLICABLE */
			if(is_dir(getcwd() . '/manifest/cache') == false || is_dir(getcwd() . '/manifest/tmp') == false) {
				$button = new XMLElement('input');
				$button->setAttribute('type','submit');
				$button->setAttribute('class','button');
				if(is_dir(getcwd() . '/manifest/cache') == false && is_dir(getcwd() . '/manifest/tmp') == false) {
					$button->setAttribute('name','action[create-tmp-cache]');
					$button->setAttribute('value',__('Create Cache/Tmp folders'));
				} elseif(is_dir(getcwd() . '/manifest/cache') == false && is_dir(getcwd() . '/manifest/tmp') != false) {
					$button->setAttribute('name','action[create-cache]');
					$button->setAttribute('value',__('Create Cache folder'));
				} elseif(is_dir(getcwd() . '/manifest/cache') != false && is_dir(getcwd() . '/manifest/tmp') == false) {
					$button->setAttribute('name','action[create-tmp]');
					$button->setAttribute('value',__('Create Tmp folder'));
				}
				$this->Form->appendChild($button);
			}
			
			/* CREATE TABLE */
			$table = new XMLElement('table');

			$tableBody = array();
			$tableHead = array(
				array(__('Directory'), 'col'),
				array(__('Octal Permissions'), 'col'),
				array(__('Full Permissions'), 'col')
			);
			
			/* FIND THE RIGHT PERMISSIONS FOR THE ENVIRONMENT */
			$fstat = $dstat = array('uid' => 0, 'gid' => 0);
			// Create test directory/file and get information on each
			try{
				mkdir('test');
				$dstat = stat('test');
				
				// Get information about newly created file
				if (file_put_contents('test/test.txt', 'test')) {
					$fstat = stat('test/test.txt');
					unlink('test/test.txt');
				}
				
				// Cleanup
				rmdir('test');
			} 
			// If directory creation fails, catch the error and alert user
			catch (Exception $e) {
				Administration::instance()->Page->pageAlert(
					__('Exception caught: Health Check could not create a test directory to determine your server permission requirements. Your recommended permissions will default to Symphony recommendations'),
					Alert::ERROR
				);
			}	
			// Get information about FTP uploaded directory/file
			$ftpdstat = stat('symphony');
			$ftpfstat = stat('index.php');
			
			if(is_array($ftpdstat) && is_array($ftpfstat)) {
				$result = array();
				if ($ftpfstat['uid'] == $fstat['uid']) {
					// If user IDs match
					$result['file'] = '0644';
				} else if ($ftpfstat['gid'] == $fstat['gid']) {
					// If group IDs match
					$result['file'] = '0664';
				} else if (isset($fstat['mode'])) {
					$result['file'] = substr(decoct($fstat['mode']), -3);
				} else {
					// Everything failed, so return "default" defaults.
					$result['file'] = '0644';
				}
		
				if ($ftpdstat['uid'] == $dstat['uid']) {
					// If user IDs match
					$result['directory'] = '0755';
				} else if ($ftpdstat['gid'] == $dstat['gid']) {
					// If group IDs match
					$result['directory'] = '0775';
				} else if (isset($dstat['mode'])) {
					$result['directory'] = substr(decoct($dstat['mode']), -3);
				} else {
					// Everything failed, so return "default" defaults.
					$result['directory'] = '0755';
				}
			} else {
				Administration::instance()->Page->pageAlert(
					__('Exception caught: Health Check could not test against Symphony core files. Your recommended permissions will default to Symphony recommendations'),
					Alert::ERROR
				);
				
				$result['file'] = '0644';
				$result['directory'] = '0755';
			}
	
			/* THIS IS HORRIBLE TO LOOK AT BUT IT'S THE ONLY METHOD I FOUND TO CHANGE OCTAL INTO 'drwxrwxrwx' ETC */
			function info($fileperms) {
				// Socket
				if (($fileperms & 0xC000) == 0xC000) $info = 's';
				// Symbolic Link
				elseif (($fileperms & 0xA000) == 0xA000) $info = 'l';
				// Regular
				elseif (($fileperms & 0x8000) == 0x8000) $info = '-';
				// Block special
				elseif (($fileperms & 0x6000) == 0x6000) $info = 'b';
				// Directory
				elseif (($fileperms & 0x4000) == 0x4000) $info = 'd';
				// Character special
				elseif (($fileperms & 0x2000) == 0x2000) $info = 'c';
				// FIFO pipe
				elseif (($fileperms & 0x1000) == 0x1000) $info = 'p';
				// Unknown
				else $info = 'u';
				
				// Owner
				$info .= (($fileperms & 0x0100) ? 'r' : '-');
				$info .= (($fileperms & 0x0080) ? 'w' : '-');
				$info .= (($fileperms & 0x0040) ?
				            (($fileperms & 0x0800) ? 's' : 'x' ) :
				            (($fileperms & 0x0800) ? 'S' : '-'));
				
				// Group
				$info .= (($fileperms & 0x0020) ? 'r' : '-');
				$info .= (($fileperms & 0x0010) ? 'w' : '-');
				$info .= (($fileperms & 0x0008) ?
				            (($fileperms & 0x0400) ? 's' : 'x' ) :
				            (($fileperms & 0x0400) ? 'S' : '-'));
				
				// World
				$info .= (($fileperms & 0x0004) ? 'r' : '-');
				$info .= (($fileperms & 0x0002) ? 'w' : '-');
				$info .= (($fileperms & 0x0001) ?
				            (($fileperms & 0x0200) ? 't' : 'x' ) :
				            (($fileperms & 0x0200) ? 'T' : '-'));
				
				return $info;
			}			

			/* ARRAY_UNIQUE DIDN'T WORK, SO RUN THIS FUNCTION INSTEAD */
			function remove_duplicates(array $array){
				$tmp_array = array();

				foreach($array as $key => $val) {
					if (!in_array($val, $tmp_array)) {
						$tmp_array[$key]  = $val;
					}
				}

				return $tmp_array;
			}
			
			/* CREATE DIRECTORY ARRAY AND REMOVE DUPLICATES */
			$directory = array('/manifest/cache','/manifest/tmp','/manifest/config.php','/workspace/data-sources/','/workspace/events/');
			if($extensionManager->fetchStatus('xmlimporter') == EXTENSION_ENABLED) $directory[] =  '/workspace/xml-importers';
			foreach(remove_duplicates($destinations) as $destination) $directory[] = $destination['destination'];
		   
			/* FOREACH ITEM IN THE DIRECTORY ARRAY */
		   	foreach($directory as $dir) {
		   		// Get full file path of directory
				$d = getcwd() . __($dir);
				// Check it is a directory, or the config file
				if(is_dir($d) == true || $dir == '/manifest/config.php') {
					// Get permissions of directory
					$permissions = substr(sprintf("%o", fileperms($d)), -4);
					// Output directory name and permissions in the table, with a uniquely named checkbox (for selecting)
					$td_directory = Widget::TableData(General::sanitize(__($dir)));
					$td_directory->appendChild(Widget::Input("item[".$dir."]",null, 'checkbox'));
					$td_permissions = Widget::TableData(General::sanitize($permissions));
					$td_full = Widget::TableData(General::sanitize(info(fileperms($d))));
					// Another directory check to recommend correct permissions
					if(is_dir($d)) {
						if($permissions != $result['directory']) {
							$tableBody[] = Widget::TableRow(
								array($td_directory, $td_permissions, $td_full), 'invalid'
							);
						} else {
							$tableBody[] = Widget::TableRow(
								array($td_directory, $td_permissions, $td_full)
							);
						}
					}
					// File check to recommend correct permissions
					if(is_file($d)) {
						if($permissions != $result['file']) {
							$tableBody[] = Widget::TableRow(
								array($td_directory, $td_permissions, $td_full), 'invalid'
							);
						} else {
							$tableBody[] = Widget::TableRow(
								array($td_directory, $td_permissions, $td_full)
							);
						}
					}
				} else {
					// If there is no file or directory, then it doesn't exist.
					$td_directory = Widget::TableData(General::sanitize(__($dir)));
					$td_directory->appendChild(Widget::Input("item['.$d.']",null, 'checkbox'));
					$td_permissions = Widget::TableData(General::sanitize(__('WARNING: This directory does not exist.')));
					$td_full = Widget::TableData(General::sanitize(''));
					$tableBody[] = Widget::TableRow(
						array($td_directory, $td_permissions, $td_full), 'invalid'
					);
				}
			}
			
			/* CREATE RECOMMENDED TEXT ELEMENTS */
			$recommendation = new XMLElement('div', null, array('class'=>'recommendation'));
			$recommendation->appendChild(new XMLElement('p', __('Based on basic tests with your server, your recommended permissions are:')));
			$recommendation_list = new XMLElement('ul');
			$recommendation_list->appendChild(new XMLElement('li', __('Directories: ').$result['directory']));
			$recommendation_list->appendChild(new XMLElement('li', __('Files: ').$result['file']));
			$recommendation->appendChild($recommendation_list);
			$this->Contents->appendChild($recommendation);
			
			/* APPEND COLUMNS TO THE TABLE */
			$table = Widget::Table(
				Widget::TableHead($tableHead), 
				Widget::TableBody($tableBody)
			);
			$table->setAttribute('class', 'selectable');
			
			/* APPEND TABLE TO THE PAGE */
			$this->Form->appendChild($table);	
			
			/* CREATE SELECT BOX CONTAINING PERMISSIONS OPTIONS */
			$actions = new XMLElement('div');
			$actions->setAttribute('class', 'actions');
			
			$options = array(
				array(null, false, __('With Selected...')),
				array('0777', false, __('Update to 0777')),
				array('0755', false, __('Update to 0755')),
				array('0750', false, __('Update to 0750')),
				array('0644', false, __('Update to 0644')),
				array('0600', false, __('Update to 0600'))									
			);

			$actions->appendChild(Widget::Select(__('with-selected'), $options));
			$actions->appendChild(Widget::Input('action[permissions]', 'Apply', 'submit'));
			
			$this->Form->appendChild($actions);
		}
		
		public function __actionIndex() {
			$checked = ((isset($_POST['item']) && is_array($_POST['item'])) ? array_keys($_POST['item']) : null);
			
			try{
				if(array_key_exists('permissions', $_POST['action'])) {
					if (is_array($checked) and !empty($checked)) {
						switch ($_POST['with-selected']) {
							case '0777':
								foreach ($checked as $item) chmod(getcwd() . $item, 0777);
								break;
							case '0755':
								foreach ($checked as $item) chmod(getcwd() . $item, 0755);
								break;
							case '0750':
								foreach ($checked as $item) chmod(getcwd() . $item, 0750);
								break;
							case '0644':
								foreach ($checked as $item) chmod(getcwd() . $item, 0644);
								break;
							case '0600':
								foreach ($checked as $item) chmod(getcwd() . $item, 0600);
								break;
						}
					}
				}
			} catch (Exception $e) {
				Administration::instance()->Page->pageAlert(
					__('Exception caught: '.$e->getMessage()),
					Alert::ERROR
				);
			}
			
			try{
				if(array_key_exists('create-tmp-cache', $_POST['action'])) {
					mkdir(getcwd() . '/manifest/tmp', 0777);
					mkdir(getcwd() . '/manifest/cache', 0777);
				}elseif(array_key_exists('create-tmp', $_POST['action'])) {
					mkdir(getcwd() . '/manifest/tmp', 0777);
				}elseif(array_key_exists('create-cache', $_POST['action'])) {
					mkdir(getcwd() . '/manifest/cache', 0777);
				}
			} catch (Exception $e) {
				Administration::instance()->Page->pageAlert(
					__('Exception caught: '.$e->getMessage()),
					Alert::ERROR
				);
			}
		}
	}