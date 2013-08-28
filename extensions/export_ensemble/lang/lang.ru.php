<?php

	$about = array(
		'name' => 'Русский',
		'author' => array(
			'name' => 'Александр Бирюков',
			'email' => 'info@alexbirukov.ru',
			'website' => 'http://alexbirukov.ru'
		),
		'release-date' => '2012-06-16'
	);

	/**
	 * Export Ensemble
	 */
	$dictionary = array(

		'Export Ensemble will not be able to download ZIP archives, since the "<a href="http://php.net/manual/en/book.zip.php">ZipArchive</a>" class is not available. To enable ZIP downloads, compile PHP with the <code>--enable-zip</code> flag.' => 
		'Функция экспорта сборки не может создать ZIP архивы, т.к. класс "<a href="http://php.net/manual/en/book.zip.php">ZipArchive</a>" недоступен. Для включения ZIP архивации необходимо скомпилировать PHP с ключом <code>--enable-zip</code>.',

		'Export Ensemble is not able to download ZIP archives, since the "<a href="http://php.net/manual/en/book.zip.php">ZipArchive</a>" class is not available. To enable ZIP downloads, compile PHP with the <code>--enable-zip</code> flag. Try saving your install files instead and follow the README instructions.' => 
		'Функция экспорта сборки не может создать ZIP архивы, т.к. класс "<a href="http://php.net/manual/en/book.zip.php">ZipArchive</a>" недоступен. Для включения ZIP архивации необходимо скомпилировать PHP с ключом <code>--enable-zip</code>. Попробуйте сохранить файлы установщика и следуйте инструкциям в файле README.',

		'Export Ensemble' => 
		'Экспорт сборки',

		'Save Install Files' => 
		'Сохранить установочные файлы',

		'Warning: It appears you do not have the "ZipArchive" class available. To enable ZIP download, ensure that PHP is compiled with <code>--enable-zip</code>' => 
		'Внимание: По всей вероятности у вас отсутствует класс "ZipArchive". Для получения возможности ZIP архивации убедитесь, что PHP скомпилирован с ключом <code>--enable-zip</code>',

		'Download ZIP' => 
		'Скачать ZIP',

		'Save (overwrite) install files or package entire site as a <code>.zip</code> archive for download.' => 
		'Сохранить (перезаписать) файлы установки в виде <code>.zip</code> архива для закачки.',

		'An error occurred while trying to write the <code>install.sql</code> file. Check the file permissions.' => 
		'Произошла ошибка при попытке записи файла <code>install.sql</code>. Проверьте права на файл.',

		'An error occurred while trying to write the <code>config_default.php</code> file. Check the file permissions.' => 
		'Произошла ошибка при попытке записи файла <code>config_default.php</code>. Проверьте права на файл.',

		'An error occurred while trying to write the <code>workspace/install.sql</code> file. Check the file permissions.' => 
		'Произошла ошибка при попытке записи файла <code>workspace/install.sql</code>. Проверьте права на файл.',

		'The install files were successfully saved.' => 
		'Установочные файлы успешно сохранены.',

		'Check permissions for the /manifest/tmp directory.' => 
		'Проверьте права на каталог /manifest/tmp',

	);
