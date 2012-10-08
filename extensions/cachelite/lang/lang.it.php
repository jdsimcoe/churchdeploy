<?php

	$about = array(
		'name' => 'Italiano',
		'author' => array(
			'name' => 'Simone Economo',
			'email' => 'my.ekoes@gmail.com',
			'website' => 'http://lineheight.net',
		),
	);
	
	
	/*
	 * EXTENSION: Cache Lite
	 * Localisation strings
	 */

	$dictionary = array(

		'Cache Period' =>
		'Durata della cache',

		'Length of cache period in seconds.' =>
		'Durata della cache in secondi',

		'Excluded URLs' =>
		'URL da escludere',

		'Add a line for each URL you want to be excluded from the cache. Add a <code>*</code> to the end of the URL for wildcard matches.' =>
		'Un URL per ogni riga. Il carattere "*" sta per "ogni"',

		'%s Show comments in page source?' =>
		'%s Mostra le informazioni sulla cache nel codice sorgente di ciascuna pagina',

		'%s Expire cache when entries are created/updated through the backend?' =>
		'%s Resetta la cache quando le voci vengono create/modificate dal pannello di amministrazione',

		'Expire cache for pages showing this entry' =>
		'Svuota la cache per le pagine che mostrano una voce',

		'Expire cache for pages showing content from this section' =>
		'Svuota la cache per le pagine che mostrano una sezione',

		'Expire cache for the passed URL' =>
		'Svuota la cache per un determinato URL',

		'CacheLite: Expiring the cache' =>
		'Svuotare la cache con CacheLite',

		'When editing existing entries (one or many, supports the <em>Allow Multiple</em> option) any pages showing this entry will be flushed. Add the following in your form to trigger this filter:' =>
		'Dopo aver modificato una o pi&ugrave; voci (l\'azione &egrave; compatibile con <code>Consenti l\'invio di pi&ugrave; voci</code>), la cache per tutte le pagine in cui appaiono tali voci verr&agrave; svuotata. Per attivare questa azione inserisci nel tuo form:',

		'This will flush the cache of pages using any entries from this event&#8217;s section. Since you may want to only run it when creating new entries, this will only run if you pass a specific field in your HTML:' =>
		'La cache per le pagine in cui compare qualsiasi tipo di contenuto appartenente a una certa sezione verr&agrave; svuotata. Dal momento che potresti voler svuotare la cache solo quando vengono create nuove voci, questa azione verr&agrave; eseguita solo se nel form compare:',

		'This will expire the cache of the URL at the value you pass it. For example' =>
		'Verr&agrave; svuotata la cache per l\'URL specificato, come nell\'esempio:',

		'Will flush the cache for <code>http://domain.tld/article/123/</code>. If no value is passed it will flush the cache of the current page (i.e., the value of <code>action=""</code> in you form):' =>
		'In questo caso, la cache per <code>http://dominio.com/article/123/</code> verr&agrave; svuotata. In caso contrario, in assenza di un URL, verr&agrave; svuotata la cache per la pagina corrente (quella specificata nell\'attributo <code>action</code> del tuo form):',

	);

?>
