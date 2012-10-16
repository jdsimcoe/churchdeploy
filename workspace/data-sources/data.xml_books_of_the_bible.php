<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcexml_books_of_the_bible extends Datasource{

		public $dsParamROOTELEMENT = 'xml-books-of-the-bible';

		

		

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'XML: Books of the Bible',
				'author' => array(
					'name' => 'Kirk Strobeck',
					'website' => 'http://72.10.33.203',
					'email' => 'kirk@strobeck.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2012-03-14T03:49:19+00:00'
			);
		}

		public function getSource(){
			return 'static_xml';
		}

		public function allowEditorToParse(){
			return true;
		}

		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				$this->dsSTATIC = '<books-of-the-bible>
  <entry number=\"01\">
    <name handle=\"genesis\">Genesis</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"02\">
    <name handle=\"exodus\">Exodus</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"03\">
    <name handle=\"leviticus\">Leviticus</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"04\">
    <name handle=\"numbers\">Numbers</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"05\">
    <name handle=\"deuteronomy\">Deuteronomy</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"06\">
    <name handle=\"joshua\">Joshua</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"07\">
    <name handle=\"judges\">Judges</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"08\">
    <name handle=\"ruth\">Ruth</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"09\">
    <name handle=\"1-samuel\">1 Samuel</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"10\">
    <name handle=\"2-samuel\">2 Samuel</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"11\">
    <name handle=\"1-kings\">1 Kings</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"12\">
    <name handle=\"2-kings\">2 Kings</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"13\">
    <name handle=\"1-chronicles\">1 Chronicles</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"14\">
    <name handle=\"2-chronicles\">2 Chronicles</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"15\">
    <name handle=\"ezra\">Ezra</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"16\">
    <name handle=\"nehemiah\">Nehemiah</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"17\">
    <name handle=\"esther\">Esther</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"18\">
    <name handle=\"job\">Job</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"19\">
    <name handle=\"psalms\">Psalms</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"20\">
    <name handle=\"proverbs\">Proverbs</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"21\">
    <name handle=\"ecclesiastes\">Ecclesiastes</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"22\">
    <name handle=\"song-of-solomon\">Song of Solomon</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"23\">
    <name handle=\"isaiah\">Isaiah</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"24\">
    <name handle=\"jeremiah\">Jeremiah</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"25\">
    <name handle=\"lamentations\">Lamentations</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"26\">
    <name handle=\"ezekiel\">Ezekiel</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"27\">
    <name handle=\"daniel\">Daniel</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"28\">
    <name handle=\"hosea\">Hosea</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"29\">
    <name handle=\"joel\">Joel</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"30\">
    <name handle=\"amos\">Amos</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"31\">
    <name handle=\"obadiah\">Obadiah</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"32\">
    <name handle=\"jonah\">Jonah</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"33\">
    <name handle=\"micah\">Micah</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"34\">
    <name handle=\"nahum\">Nahum</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"35\">
    <name handle=\"habakkuk\">Habakkuk</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"36\">
    <name handle=\"zephaniah\">Zephaniah</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"37\">
    <name handle=\"haggai\">Haggai</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"38\">
    <name handle=\"zechariah\">Zechariah</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"39\">
    <name handle=\"malachi\">Malachi</name>
    <testament handle=\"old-testament\" abbreviation=\"OT\">Old Testament</testament>
  </entry>
  <entry number=\"40\">
    <name handle=\"matthew\">Matthew</name>
    <testament handle=\"new-testament\" abbreviation=\"NT\">New Testament</testament>
  </entry>
  <entry number=\"41\">
    <name handle=\"mark\">Mark</name>
    <testament handle=\"new-testament\" abbreviation=\"NT\">New Testament</testament>
  </entry>
  <entry number=\"42\">
    <name handle=\"luke\">Luke</name>
    <testament handle=\"new-testament\" abbreviation=\"NT\">New Testament</testament>
  </entry>
  <entry number=\"43\">
    <name handle=\"john\">John</name>
    <testament handle=\"new-testament\" abbreviation=\"NT\">New Testament</testament>
  </entry>
  <entry number=\"44\">
    <name handle=\"acts\">Acts</name>
    <testament handle=\"new-testament\" abbreviation=\"NT\">New Testament</testament>
  </entry>
  <entry number=\"45\">
    <name handle=\"romans\">Romans</name>
    <testament handle=\"new-testament\" abbreviation=\"NT\">New Testament</testament>
  </entry>
  <entry number=\"46\">
    <name handle=\"1-corinthians\">1 Corinthians</name>
    <testament handle=\"new-testament\" abbreviation=\"NT\">New Testament</testament>
  </entry>
  <entry number=\"47\">
    <name handle=\"2-corinthians\">2 Corinthians</name>
    <testament handle=\"new-testament\" abbreviation=\"NT\">New Testament</testament>
  </entry>
  <entry number=\"48\">
    <name handle=\"galatians\">Galatians</name>
    <testament handle=\"new-testament\" abbreviation=\"NT\">New Testament</testament>
  </entry>
  <entry number=\"49\">
    <name handle=\"ephesians\">Ephesians</name>
    <testament handle=\"new-testament\" abbreviation=\"NT\">New Testament</testament>
  </entry>
  <entry number=\"50\">
    <name handle=\"philippians\">Philippians</name>
    <testament handle=\"new-testament\" abbreviation=\"NT\">New Testament</testament>
  </entry>
  <entry number=\"51\">
    <name handle=\"colossians\">Colossians</name>
    <testament handle=\"new-testament\" abbreviation=\"NT\">New Testament</testament>
  </entry>
  <entry number=\"52\">
    <name handle=\"1-thessalonians\">1 Thessalonians</name>
    <testament handle=\"new-testament\" abbreviation=\"NT\">New Testament</testament>
  </entry>
  <entry number=\"53\">
    <name handle=\"2-thessalonians\">2 Thessalonians</name>
    <testament handle=\"new-testament\" abbreviation=\"NT\">New Testament</testament>
  </entry>
  <entry number=\"54\">
    <name handle=\"1-timothy\">1 Timothy</name>
    <testament handle=\"new-testament\" abbreviation=\"NT\">New Testament</testament>
  </entry>
  <entry number=\"55\">
    <name handle=\"2-timothy\">2 Timothy</name>
    <testament handle=\"new-testament\" abbreviation=\"NT\">New Testament</testament>
  </entry>
  <entry number=\"56\">
    <name handle=\"titus\">Titus</name>
    <testament handle=\"new-testament\" abbreviation=\"NT\">New Testament</testament>
  </entry>
  <entry number=\"57\">
    <name handle=\"philemon\">Philemon</name>
    <testament handle=\"new-testament\" abbreviation=\"NT\">New Testament</testament>
  </entry>
  <entry number=\"58\">
    <name handle=\"hebrews\">Hebrews</name>
    <testament handle=\"new-testament\" abbreviation=\"NT\">New Testament</testament>
  </entry>
  <entry number=\"59\">
    <name handle=\"james\">James</name>
    <testament handle=\"new-testament\" abbreviation=\"NT\">New Testament</testament>
  </entry>
  <entry number=\"60\">
    <name handle=\"1-peter\">1 Peter</name>
    <testament handle=\"new-testament\" abbreviation=\"NT\">New Testament</testament>
  </entry>
  <entry number=\"61\">
    <name handle=\"2-peter\">2 Peter</name>
    <testament handle=\"new-testament\" abbreviation=\"NT\">New Testament</testament>
  </entry>
  <entry number=\"62\">
    <name handle=\"1-john\">1 John</name>
    <testament handle=\"new-testament\" abbreviation=\"NT\">New Testament</testament>
  </entry>
  <entry number=\"63\">
    <name handle=\"2-john\">2 John</name>
    <testament handle=\"new-testament\" abbreviation=\"NT\">New Testament</testament>
  </entry>
  <entry number=\"64\">
    <name handle=\"3-john\">3 John</name>
    <testament handle=\"new-testament\" abbreviation=\"NT\">New Testament</testament>
  </entry>
  <entry number=\"65\">
    <name handle=\"jude\">Jude</name>
    <testament handle=\"new-testament\" abbreviation=\"NT\">New Testament</testament>
  </entry>
  <entry number=\"66\">
    <name handle=\"revelation\">Revelation</name>
    <testament handle=\"new-testament\" abbreviation=\"NT\">New Testament</testament>
  </entry>
</books-of-the-bible>';
include(TOOLKIT . '/data-sources/datasource.static.php');
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			

			return $result;
		}

	}
