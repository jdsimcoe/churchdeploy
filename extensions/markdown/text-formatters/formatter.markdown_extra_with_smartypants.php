<?php

	Class formatterMarkdown_Extra_With_Smartypants extends TextFormatter{

		private static $_parser;

		public function about(){
			return array(
				'name' => 'Markdown Extra (With SmartyPants)',
				'version' => '1.8',
				'release-date' => '2010-04-30',
				'author' => array(
					'name' => 'Alistair Kearney',
					'website' => 'http://symphony-cms.com',
					'email' => 'alistair@symphony-cms.com'
				),
				'description' => 'Write entries in the Markdown format. Wrapper for the PHP Markdown text-to-HTML conversion tool written by Michel Fortin.'
			);
		}
				
		public function run($string){
			if(!self::$_parser){
				if (!class_exists('MarkdownExtra_Parser'))
					include_once(EXTENSIONS . '/markdown/lib/php-markdown-extra-1.2.4/markdown.php');
				self::$_parser = new MarkdownExtra_Parser();
			}
			
			// Markdown transformation
			$result = stripslashes(self::$_parser->transform($string));
			
			if(!function_exists('SmartyPants')) include_once(EXTENSIONS . '/markdown/lib/php-smartypants-1.5.1e/smartypants.php');
			
			// Apply "Smarty Pants" formatting
			$result = SmartyPants(
				stripslashes(self::$_parser->transform($string))
			);

			return $result;
		}
		
	}

