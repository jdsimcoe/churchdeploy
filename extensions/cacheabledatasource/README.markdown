# Cacheable Datasource

* Version: 1.1
* Author: [Nick Dunn](http://nick-dunn.co.uk)
* Build Date: 2011-10-04
* Requirements: Symphony 2.3 (if using less than Symphony 2.3 please use v0.5 of this extension)

## Description

Some datasources simply execute a lot of database queries. It's a fact of life, so instead of complaining, learn to deal with it ;-) You can:

* reduce the number of fields and entries that the datasource is fetching
* use the [Cachelite extension](http://symphony-cms.com/download/extensions/view/20455/) to cache the entire rendered HTML output of pages (useful to survive big traffic spikes)

However sometimes neither of these are viable options. Perhaps you really *need* all of that data in your XML all of the time, or perhaps you have a "Logged in as {user}" notice in the header that means you can't cache the HTML output of the page for all users.

This extension enables datasources that fetch entries from sections to be cached — their XML result is stored in your server until the timeout expires, meaning fewer calls to your database and hopefully more pages served, faster.

(The idea stemmed from explorations in a forum discussion [Datasource Caching](http://symphony-cms.com/discuss/thread/32535/).)

## How do I use it?
Install this extension like any other. When you create or edit a datasource that fetches entries from a section, you will see an additional "Cache" option at the bottom of the editor. Change the number of seconds to suit your requirement. A value of `0` means no caching.

## Refresh your frontend page
View the `?debug` XML of your frontend page and you should see the cached XML and the age of the cache in seconds. The cached XML might jump to the top of the order in the XML source. This is normal, and is a by-product of how Symphony works out ordering on the fly.

The first time you execute the datasource you will see the data marked as fresh. This has come directly from the database as usual:

	<my-data-source cache-age="fresh">

Subsequent refreshes will show you the age of the cached data in seconds:

	<my-data-source cache-age="30s">

## Are Output Parameters supported?
Yes! If a datasource outputs parameters into the param pool then these are cached along with the XML.

## How do I purge the cache?
Caches expire when their timeouts are met. You can manually purge the cache by looking into your `/manifest/cache/datasources` folder and deleting files with names beginning with the name of your datasource.

## Why are so many cache files created?
Cache files are never deleted, only overwritten when they have expired. It is normal to have many files generated for each datasource since the filename is a hashed signature of all of its configuration properties and filters. This means that if you have pagination enabled on your datasource, a new cache file is generated for each page of results, since each page creates a unique combination of filters (and therefore unique XML).