# CacheLite

## Installation 

1. Upload the 'cachelite' folder in this archive to your Symphony 'extensions' folder.
2. Enable it by selecting the "CacheLite", choose Enable from the with-selected menu, then click Apply.
3. Go to System > Preferences and enter the cache period (in seconds).
4. The output of your site will now be cached.


## Usage

### Excluding pages

By default all pages are cached. You can exclude URLs from the cache by adding them to the list of excluded pages in System > Preferences. Each URL must sit on a separate line and wildcards (`*`) may be used at the end of URLs to match *everything* below that URL.

Excluded pages are assumed to originate from the root. All the following examples will resolve to the same page (providing there are none below it in  the hierarchy):

	/about-us/get-in-touch/*
	http://root.com/about-us/get-in-touch/
	about-us/get-in-touch*
	/about-us/get*

Note that caching is *not* done for logged in users. This lets you add administrative tools to the frontend of your site without them being cached for normal users.

### Flushing the cache

Caching is done on a per-URL basis. To manually flush the cache for an individual page simply append `?flush` to the end of its URL. To flush the cache for the entire site you just need to append `?flush=site` to any URL in the site. You *must* be logged in to flush the cache.

You can also remove cache files using your FTP client: navigate to `/manifest/cache` and remove the files named as `cache_{hash}`.

The cache of each page will automatically flush itself after the timeout period is reached. The timeout period can be modified on the System > Preferences page.

### Flushing the cache when content changes

You can selectively flush the cache when new entries are created or an entry is updated. Updates through both the backend and frontend Events are supported. To flush the cache when entries are modified in the Symphony backend navigate to System > Preferences and tick the "Expire cache when entries are created/updated through the backend?" checkbox. When an entry is modified, one of two outcomes are achieved:

a) **When a brand new entry is created**, the cache will be flushed for any pages that show entries from *the entry's parent section*.  
For example if you have an Articles section which is used to display a list of recent article titles on the Home page; a list of articles on an Articles Index page; and another page to read an Article; the cache of all three pages will be flushed when a new Article entry is created.

b) **When an existing entry is edited**, the cache will be flushed for any pages that display *this entry*.  
In the above example, if the article being edited is very old and no longer features on the Home page or Articles Index page, only the specific instance of the Aricle view page for this entry will be flushed. Other Article view pages remain cached.

The same conditions are provided for frontend Events through the use of Event Filters. To add this functionality to your event, select one or all of the CacheLite event filters when configuring your event and trigger them using values in your HTML form:

a) **"CacheLite: expire cache for pages showing this entry"**  
When editing existing entries (one or many, supports the Allow Multiple option) any pages showing this entry will be flushed. Send the following in your form to trigger this filter:

	<input type="hidden" name="cachelite[flush-entry]" value="yes"/>

b) **CacheLite: expire cache for pages showing content from this section**  
This will flush the cache of pages using any entries from this event's *section*. Since you may want to only run it when creating new entries, this will only run if you pass a specific field in your HTML:

	<input type="hidden" name="cachelite[flush-section]" value="yes"/>

c) **CacheLite: expire cache for the passed URL**
  
This allows you to selectively flush the cache during Event execution, which is useful if you want to expire the cache as new entries are added but don't want to flush the whole *section*. This filter will only run if you pass a specific field in your HTML:
  
    <input type="hidden" name="cachelite[flush-url]" value="/article/123/"/>

If you pass this field with no value, it will default to the *current* URL. That is, from a page at <http://domain.tld/article/123/>, submitting the following:

	<input type="hidden" name="cachelite[flush-url]"/>

Would have the same result as the previous example.

## Compatibility

Due to changes in the Symphony core, version 1.0.0+ of the CacheLite extension only works with Symphony 2.0.6+. Versions prior to 1.0.0 are compatible with Symphony 2.0.1-2.0.3. If you're using 2.0.4-5 then you should upgrade :p

## Changelog

### 1.1.3

* Don't cache is there is `$_POST` data

### 1.1.2

* Romanian translation from [vlad-ghita](https://github.com/vlad-ghita)
* Check context is set before clearing references

### 1.1.1

* Fix bug in excluded pages introduced by change in 1.1.0

### 1.1.0

* Fix bug in `?flush`
* Made sure $_GET parameters are parsed consistently (i.e., regardless of order)

### 1.0.12

* Encode URLs

### 1.0.11

* Removed references to `Frontend`
* Cleaned up accessors

### 1.0.10

* Added support additional content types via the Content Type Mappings extension

### 1.0.9

* Added 304 header support

### 1.0.8

* Localisation and italian translation from [eKoeS](http://github.com/eKoeS)

### 1.0.7

* Minor cleanup to use newer accessors for Administration/Symphony instances

### 1.0.6

* Added functions for translation
* Fixed matching on page `?flush`
* Defaults for configuration

### 1.0.5

* Changed `intercept_page` delegate to `FrontendPageResolved`. Should now execute immediately after the Page is found, but before anything else happens.
* Because of the change above, headers are determined manually (as with normal pages). Supported types are HTML, XML and JSON.

### 1.0.4

* Added support for flushing the cache on a per-URL basis during `Event` execution

### 1.0.3

* Subscribe to the Delete delegate to flush pages when an entry is removed (delegate not included in Symphony 2.0.6) (Nick Dunn)
* Fixed bug introduced in 1.0.2 where caching was occurring for logged in users
* Fixed bug introduced in 1.0.2 where `?flush` was being included in the cache ID

### 1.0.2

* Added support for flushing the cache based on entry/section IDs (Nick Dunn)
