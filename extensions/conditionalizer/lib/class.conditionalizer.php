<?php

class Conditionalizer {

		// Check syntax
		public static function parse($e) {
			/*
				Valid expression should result in array(
					0 => whole expression,
					1 => function,
					2 => param,
					3 => operand,
					4 => param,
				);
			*/
			if (!preg_match('/(?:^[^\(]*)(\(if\s+(value of|any of|all of)\s*(\((?:[^\(\)]+|(?3))*\))\s+((?:is|are)(?: not|)(?: in|))\s*(\((?:[^\(\)]+|(?5))*\))\s*\))/', $e, $r))
				return array();
			
			array_shift($r); // Remove $r[0] that contains data which we do not want
			return $r;
		}

		// Evaluate expression to boolean value
		public static function evaluate($e) {
			// (if value of ({$ds-value}) is (one))
			// (if value of ({$ds-value}) is not ())
			// (if any of ({$ds-value}) is in (one,two,three))
			// (if all of ({$ds-value}) are in (one,two,three))
			// (if any of ((if value of ({$ds-value}) is (one)), {$ds-is-true}) is (no))

			if (is_array($e)) $r = $e; // Recursive call for sub expression, $e is already parsed
			else $r = self::parse($e);

			if (empty($r)) return false;

			$r[2] = substr($r[2], 1, -1); // Remove first level parenthesis
			$r[4] = substr($r[4], 1, -1); // Same here

			// Parse sub expressions
			for ($i = 2; $i <= 4; $i+=2) {
				$max = 10;
				while ($max--) {
					$s = self::parse($r[$i]);
					if (empty($s)) break;

					$r[$i] = str_replace($s[0], (self::evaluate($s) ? 'yes' : 'no'), $r[$i]);
				}
			}

			$r[2] = trim($r[2]);
			$r[4] = trim($r[4]);
			switch ($r[3]) {
				case 'is in':
				case 'are in':
					if ((!$r[2] || !$r[4]) && $r[2] != $r[4]) return false;

					$r[2] = preg_split('/\s*,\s*/', $r[2]);
					$r[4] = preg_split('/\s*,\s*/', $r[4]);
					$found = array_intersect($r[2], $r[4]);
					if ($r[1] == 'value of' || $r[1] == 'all of') {
						return (!empty($found) && count($r[2]) >= count($found) && count($r[2]) <= count($r[4]));
					}
					else if ($r[1] == 'any of') {
						return (!empty($found));
					}
					break;

				case 'is not in':
				case 'are not in':
					if ((!$r[2] || !$r[4]) && $r[2] != $r[4]) return true;

					$r[2] = preg_split('/\s*,\s*/', $r[2]);
					$r[4] = preg_split('/\s*,\s*/', $r[4]);
					$found = array_intersect($r[2], $r[4]);
					if ($r[1] == 'value of' || $r[1] == 'all of') {
						return (empty($found));
					}
					else if ($r[1] == 'any of') {
						return (empty($r[4]) || count($found) < count($r[2]));
					}
					break;

				case 'is not':
					if ($r[1] == 'value of') {
						return ($r[2] != $r[4]);
					}
					else if ($r[1] == 'any of') {
						foreach (preg_split('/\s*,\s*/', $r[2]) as $v) {
							if ($v != $r[4]) return true;
						}
						return false;
					}
					else if ($r[1] == 'all of') {
						foreach (preg_split('/\s*,\s*/', $r[2]) as $v) {
							if ($v == $r[4]) return false;
						}
					}
					break;

				case 'is':
					if ($r[1] == 'value of') {
						return ($r[2] == $r[4]);
					}
					else if ($r[1] == 'any of') {
						foreach (preg_split('/\s*,\s*/', $r[2]) as $v) {
							if ($v == $r[4]) return true;
						}
						return false;
					}
					else if ($r[1] == 'all of') {
						foreach (preg_split('/\s*,\s*/', $r[2]) as $v) {
							if ($v != $r[4]) return false;
						}
					}
					break;
			}

			return true;
		}


		// Get list of page and datasource params
		// WARNING: this can be run only in Symphony's environment, because it depends on Database and DatasourceManager!
		public static function listParams() {
			$params = array();

			// It's no fun without Symphony
			if (!defined('TOOLKIT') || !class_exists('Symphony') || !Symphony::Database()) return $params;

			// Get page params
			$pages = Symphony::Database()->fetch('SELECT params FROM tbl_pages WHERE params IS NOT NULL');
			if (is_array($pages) && !empty($pages)) {
				foreach ($pages as $page => $data) {
					if (($data = trim($data['params']))) {
						foreach (explode('/', $data) as $p) {
							$params['$'.$p] = '';
						}
					}
				}
			}

			// Get datasource generated params
			if (!class_exists('DatasourceManager')) {
				require_once(TOOLKIT . '/class.datasourcemanager.php');
			}
			foreach (DatasourceManager::listAll() as $name => $info) {
				$ds = DatasourceManager::create($name, NULL, false);
				// Support Symphony's section fields
				if (isset($ds->dsParamPARAMOUTPUT) && !empty($ds->dsParamPARAMOUTPUT)) {
					if (!is_array($ds->dsParamPARAMOUTPUT)) $params['$ds-'.$ds->dsParamROOTELEMENT] = $ds->dsParamPARAMOUTPUT;
					else {
						foreach ($ds->dsParamPARAMOUTPUT as $field) {
							$params['$ds-'.$ds->dsParamROOTELEMENT.'.'.$field] = $field;
						}
					}
				}
				// Support Parametrisator's xpaths
				if (isset($ds->dsParamParametrisator) && is_array($ds->dsParamParametrisator) && isset($ds->dsParamParametrisator['xpaths'])) {
					foreach ($ds->dsParamParametrisator['xpaths'] as $name => $xpath) {
						$params['$ds-'.$ds->dsParamROOTELEMENT.'-'.$name] = $name;
					}
				}
			}

			return $params;
		}
}
