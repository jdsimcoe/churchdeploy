<?php

	$about = array(
		'name' => 'Italiano',
		'author' => array(
			'name' => 'Simone Economo',
			'email' => 'my.ekoes@gmail.com',
			'website' => 'http://lineheight.net',
		),
		'release-date' => '2010-02-27',
	);


	/**
	 * Export Ensemble
	 */
	$dictionary = array(

		'Missing File' => 
		'File mancante',

		'Install Symphony <em>Version %s</em>' => 
		'Installa Symphony <em>versione %s</em>',

		'It appears that <code>install.sql</code> is either missing or not readable. This is required to populate the database and must be uploaded before installation can commence. Ensure that <code>PHP</code> has read permissions.' => 
		'Sembra che il file <code>install.sql</code> non esista o non abbia i permessi in lettura. Senza questo file, non &egrave; possibile popolare il database e avviare l\'installazione. Assicurati che <code>PHP</code> abbia i permessi in lettura.',

		'Existing Installation' => 
		'Installazione pre-esistente',

		'It appears that Symphony has already been installed at this location.' => 
		'Sembra che Symphony sia gi&agrave; stato installato in questa cartella.',

		'Export Ensemble cannot be installed, since the "<a href="http://php.net/manual/en/book.zip.php">ZipArchive</a>" class is not available. Ensure that PHP was compiled with the <code>--enable-zip</code> flag.' => 
		'L\'estensione \'Export Ensemble\' non può essere installata perché la classe "<a href="http://php.net/manual/en/book.zip.php">ZipArchive</a>" non &egrave; disponibile. Assicurati di aver compilato PHP con l\'opzione <code>--enable-zip</code>.',

		'Export Ensemble' => 
		'Esporta Ensemble',

		'Warning: It appears you do not have the "ZipArchive" class available. Ensure that PHP was compiled with <code>--enable-zip</code>' => 
		'<strong>Attenzione: Sembra che la classe "ZipArchive" non sia disponibile. Assicurati che PHP sia stato compilato con l\'opzione <code>--enable-zip</code>',

		'Create' => 
		'Crea l\'archivio',

		'Packages entire site as a <code>.zip</code> archive for download.' => 
		'Comprime l\'intero sito in un pacchetto <code>.zip</code> pronto da scaricare.',

	);
