# Language Redirect #

Adds language redirection to Symphony.

- Version: 1.0.3
- Date: 2011-07-02
- Requirements: Symphony 2.1.x
- Author: Jonas Coch, jonas@klaftertief.de, Vlad Ghita, vlad_micutul@yahoo.com
- GitHub Repository: <http://github.com/klaftertief/language_redirect>

## Synopsis ##

Language Redirect provides an event to redirect visitors based on browser settings, values in a cookie or default settings. It adds language and region parameters to the parameter pool and renders those parameters in a clean way at the beginning of the URL.

## Installation & Updating ##

**This extensions modifies the `.htaccess` file. You should always make a backup before you install the extension or update the preferences.**

Information about [installing and updating extensions](http://symphony-cms.com/learn/tasks/view/install-an-extension/) can be found in the Symphony documentation at <http://symphony-cms.com/learn/>.

## Usage ##

Language Redirect adds a new settings field to the Preferences Page. There you can add your supported language codes as a comma separated list. A language code has to be either a two character string like `en` (language) or a five character string like `en-au` (language-region). The extensions adds the language part as `$url-language` and the optional region part as `$url-region` (normal get parameters) to the parameter pool for usage in your datasources or XSL templates.

Don't forget to add the Language Redirect Event to the pages you want to have in different languages.

The event stores the current language an region parameters in a cookie. Visitors will be redirected depending on settings in the following order.

1. saved parameters in the cookie
2. first matched language code in browser settings
3. default language code (first in saved preferences)

For developers: Have a look at `lib/class.languageredirect.php` for using language codes internal.

## Change Log ##

**Version 1.0**
- The name of the key of the stored language codes in `/manifest/config.php` changed from `languages` to `language_codes`.

**Version 1.0.1**
- Added Romanian translation. Thanks, vladG.

**Version 1.0.2**
- Separated language identification from page redirect.

**Version 1.0.3**
- Changed static method `cleanLanguageCodes` to non-static in `LanguageRedirect` class.