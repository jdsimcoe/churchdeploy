<?php
/*----------------------------------------------------------------------------*/
	
	class BitterFormatSymphony extends BitterFormat {
		protected $tabsize = 2;
		protected $line = 1;
		protected $output = '';
		
		public function process($source) {
			$this->output = $source;
			
			$this->processTabs();
			$this->processLines();
			
			return sprintf(
				'<pre>%s</pre>',
				$this->output
			);
		}
		
		protected function processTabs() {
			while (strstr($this->output, "\t")) {
				$this->output = preg_replace_callback('%^([^\t]*)(\t+)%', array($this, 'processTabsLine'), $this->output);
			}
		}
		
		protected function processTabsLine($matches) {
			return $matches[1] . str_repeat(
				' ', strlen($matches[2]) * $this->tabsize - (strlen($matches[1]) % $this->tabsize)
			);
		}
		
		protected function processLines() {
			$tokens = preg_split('%(<span class=".*?">|</span>)%', $this->output, 0, PREG_SPLIT_DELIM_CAPTURE);
			$stack = array(); $this->output = '';
			
			$this->startLine();
			
			foreach ($tokens as $token) {
				// Close:
				if (preg_match('%^</%', $token)) {
					array_pop($stack);
					$this->output .= $token;
				}
				
				// Open:
				else if (preg_match('%^<%', $token)) {
					array_push($stack, $token);
					$this->output .= $token;
				}
				
				else {
					$characters = preg_split('//', $token);
					
					foreach ($characters as $character) {
						if ($character == "\n") {
							foreach ($stack as $alt_token) $this->output .= '</span>';
							
							$this->endLine();
						}
						
						$this->output .= $character;
						
						if ($character == "\n") {
							$this->startLine();
							
							foreach ($stack as $alt_token) $this->output .= $alt_token;
						}
					}
				}
			}
			
			$this->endLine();
		}
		
		protected function startLine() {
			$this->output .= "<line id=\"{$this->line}\">";
			$this->output .= "<marker></marker>";
			$this->output .= "<content>";
		}
		
		protected function endLine() {
			$this->line++;
			$this->output .= '</content>';
			$this->output .= '</line>';
		}
	}
	
/*----------------------------------------------------------------------------*/
	
	return new BitterFormatSymphony();
	
/*----------------------------------------------------------------------------*/
?>