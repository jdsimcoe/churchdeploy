<?php

	$about = array(
		'name' => 'Română',
		'author' => array(
			'name' => 'Vlad Ghita',
			'email' => 'vlad.ghita@xandergroup.ro',
		),
		'release-date' => '2011-03-31'
	);

	/**
	 * CacheLite
	 */
	$dictionary = array(

		'Cache Period' => 
		'Durata Cache-ului',

		'Length of cache period in seconds.' => 
		'Durata cache-ului în secunde',

		'Excluded URLs' => 
		'URL-uri excluse',

		'Add a line for each URL you want to be excluded from the cache. Add a <code>*</code> to the end of the URL for wildcard matches.' => 
		'Adăugaţi o linie pentru fiecare URL care doriţi să fie exclus din cache. Adăugaţi <code>*</code> la sfârşitul URL-ului pentru potriviri multiple.',

		'%s Show comments in page source?' => 
		'%s Afişează comentariile în sursa paginii?',

		'%s Expire cache when entries are created/updated through the backend?' => 
		'%s Expiră cache-ul la crearea sau editarea de înregistrări prin administrare?',

		'Expire cache for pages showing this entry' => 
		'Expiră cache-ul pentru paginile care afişează această înregistrare',

		'Expire cache for pages showing content from this section' => 
		'Expiră cache-ul pentru paginile care afişează conţinut din această secţiune',

		'Expire cache for the passed URL' => 
		'Expiră cache-ul pentru URL-ul transmis',

		'CacheLite: Expiring the cache' => 
		'CacheLite: Se expiră cache-ul',

		'When editing existing entries (one or many, supports the <em>Allow Multiple</em> option) any pages showing this entry will be flushed. Add the following in your form to trigger this filter:' => 
		'La editarea înregistrărilor existente (una sau mai multe, admite opţiunea <em>Permite Multiple</em>), orice pagină care afişează aceste înregistrări va fi golită. Adăugaţi următoarele în formular pentru activarea filtrului:',

		'This will flush the cache of pages using any entries from this event&#8217;s section. Since you may want to only run it when creating new entries, this will only run if you pass a specific field in your HTML:' => 
		'Aceasta va goli cache-ul pentru paginile care folosesc înregistrări ale secţiunii evenimentului. Din moment ce s-ar putea să doriţi să ruleze doar la crearea de noi înregistrări, acesta va rula doar dacă trimiteţi un câmp specific în HTML:',

		'This will expire the cache of the URL at the value you pass it. For example' => 
		'Aceasta va goli cache-ul URL-ului la valoarea pe care o trimiteţi. De exemplu',

		'Will flush the cache for <code>http://domain.tld/article/123/</code>. If no value is passed it will flush the cache of the current page (i.e., the value of <code>action=""</code> in you form):' => 
		'Va goli cache-ul pentru <code>http://domain.tld/articol/123/</code>. Dacă nicio valoarea nu este trimisă, atunci va goli cache-ul pentru pagina curentă (ex: pentru valoarea <code>action=""</code> din formular):',

	);
