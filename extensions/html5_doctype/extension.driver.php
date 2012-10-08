<?php

	Class extension_html5_doctype extends Extension{

		public function about(){
			return array(
				'name' => 'HTML5 doctype',
				'type'	=> 'output',
				'version' => '1.2.5',
				'release-date' => '2011-03-03',
				'author' => array(
					array(
						'name' => 'Nick Dunn'
					),
					array(
						'name' => 'Stephen Bau',
						'website' => 'http://domain7.com',
						'email' => 'stephen@domain7.com'
					)
				),
				'description' => 'Replace XHTML syntax with basic HTML5 syntax.',
				'compatibility' => array(
					'2.1.2' => true,
					'2.2' => true
				)
			);
		}

		public function getSubscribedDelegates(){
			return array(
				array(
					'page' => '/frontend/',
					'delegate' => 'FrontendOutputPostGenerate',
					'callback' => 'parse_html'
				),
			);
		}

		public function parse_html($context) {
			// Parse only if $context['output'] exists and it's an HTML document
			if(substr($context['output'], 0, 14) == '<!DOCTYPE html') {
				$html = $context['output'];

				// Split the HTML output into two variables:
				// $html_doctype contains the first four lines of the HTML document
				// $html_doc contains the rest of the HTML document
				$html_array = explode("\n", $html, 15);
				$html_doc = array_pop($html_array);
				$html_doctype = implode("\n", $html_array);

				// Parse the doctype to convert XHTML syntax to HTML5
				$html_doctype = preg_replace("/<!DOCTYPE [^>]+>/", "<!DOCTYPE html>", $html_doctype);
				$html_doctype = preg_replace('/ xmlns=\"http:\/\/www.w3.org\/1999\/xhtml\"| xml:lang="[^\"]*\"/', '', $html_doctype);
				$html_doctype = preg_replace('/<meta http-equiv=\"Content-Type\" content=\"text\/html; charset=(.*[a-z0-9-])\" \/>/i', '<meta charset="\1" />', $html_doctype);

				// Concatenate the fragments into a complete HTML5 document
				$html = $html_doctype . "\n" . $html_doc;

				$context['output'] = $html;
			}
		}

	}