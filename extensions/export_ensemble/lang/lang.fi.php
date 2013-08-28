<?php

  $about = array(
		'name' => 'Finnish',
		'author' => array(
			'name' => 'Leo Nikkilä',
			'email' => 'leo.nikkila@gmail.com',
			'website' => ''
		),
		'release-date' => '2013-06-23'
	);

	/**
	 * Export Ensemble
	 */
	$dictionary = array(

		'Export Ensemble will not be able to download ZIP archives, since the "<a href="http://php.net/manual/en/book.zip.php">ZipArchive</a>" class is not available. To enable ZIP downloads, compile PHP with the <code>--enable-zip</code> flag.' => 
		'Vie Ensemble ei voi kirjoittaa ZIP-tiedostoja, koska "<a href="http://php.net/manual/en/book.zip.php">ZipArchive</a>" luokkaa ei ole saatavilla. Ladataksesi ZIP-tiedostoja käännä PHP käyttäen <code>--enable-zip</code>-valitsinta.',

		'Export Ensemble is not able to download ZIP archives, since the "<a href="http://php.net/manual/en/book.zip.php">ZipArchive</a>" class is not available. To enable ZIP downloads, compile PHP with the <code>--enable-zip</code> flag. Try saving your install files instead and follow the README instructions.' => 
		'Vie Ensemble ei voi kirjoittaa ZIP-tiedostoja, koska "<a href="http://php.net/manual/en/book.zip.php">ZipArchive</a>" luokkaa ei ole saatavilla. Ladataksesi ZIP-tiedostoja käännä PHP käyttäen <code>--enable-zip</code>-valitsinta.',

		'Export Ensemble' => 
		'Vie Ensemble',

		'Save Install Files' => 
		'Tallenna asennustiedostot',

		'Warning: It appears you do not have the "ZipArchive" class available. To enable ZIP download, ensure that PHP is compiled with <code>--enable-zip</code>' => 
		'Varoitus: "ZipArchive"-luokkaa ei ole saatavilla. Ladataksesi ZIP-tiedostoja varmista, että PHP on käännetty käyttäen <code>--enable-zip</code>-ilmaisinta',

		'Download ZIP' => 
		'Lataa ZIP',

		'Save (overwrite) install files or package entire site as a <code>.zip</code> archive for download.' => 
		'Tallenna (ylikirjoita) asennustiedostot tai lataa koko sivusto <code>.zip</code>-tiedostossa.',

		'An error occurred while trying to write the <code>install.sql</code> file. Check the file permissions.' => 
		'<code>install.sql</code>-tiedostoa kirjoitettaessa tapahtui virhe. Tarkista tiedoston kirjoitusoikeudet.',

		'An error occurred while trying to write the <code>config_default.php</code> file. Check the file permissions.' => 
		'<code>config_default.php</code>-tiedostoa kirjoitettaessa tapahtui virhe. Tarkista tiedoston kirjoitusoikeudet.',

		'An error occurred while trying to write the <code>workspace/install.sql</code> file. Check the file permissions.' => 
		'<code>workspace/install.sql</code>-tiedostoa kirjoitettaessa tapahtui virhe. Tarkista tiedoston kirjoitusoikeudet.',

		'The install files were successfully saved.' => 
		'Asennustiedostot tallennettiin onnistuneesti',

		'Check permissions for the /manifest/tmp directory.' => 
		'Tarkista kansion /manifest/tmp kirjoitusoikeudet.',

	);
