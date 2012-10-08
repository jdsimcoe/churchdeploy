<?php

	Class Spit {

		public static function output($data) {
			header("Pragma: public");
			header("Expires: 0");
			header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
			header("Content-Type: application/json");
			header("Content-Length: " . strlen($data['schema']));
			header("Content-Disposition: attachment; filename=" . Spit::createFilename($data['section']) . ".scaffolds.json");
			echo $data['schema'];
			exit;
		}

		public static function createFilename($string, $delim='-') {
			// Strip out any tag
			$string = strip_tags($string);

			// Find all legal characters
			$count = preg_match_all('/[\p{L}\w:;.,+=~]+/u', $string, $matches);
			if($count <= 0 || $count == false) {
				preg_match_all('/[\w:;.,+=~]+/', $string, $matches);
			}

			// Join only legal character with the $delim
			$string = implode($delim, $matches[0]);

			// Remove leading or trailing delim characters
			$string = trim($string, $delim);

			// Make it lowercase
			$string = strtolower($string);

			return $string;
		}
	}

	if(isset($_GET) && isset($_GET['schema'])) {
		Spit::output($_GET);
	}

