# Entry URL Field
 
* Version: 1.1
* Author: [Nick Dunn](http://nick-dunn.co.uk)
* Build Date: 2011-02-07
* Requirements: Symphony 2.2

## Installation
 
1. Upload the 'entry_url_field' folder in this archive to your Symphony 'extensions' folder.
2. Enable it by selecting the "Field: Entry URL", choose Enable from the with-selected menu, then click Apply.
3. The field will be available in the list when creating a Section.


## Usage

When adding this field to a section, the following options are available to you:

* **Anchor Label** is the text used for the hyperlink in the backend
* **Anchor URL** is the URL of your entry view page on the frontend. An `<entry id="123">...</entry>` nodeset is provided from which you can grab field values, just as you would from a datasource. For example:

	/members/profile/{entry/name/@handle}/

* **Open links in a new window** enforces the hyperlink to spawn a new tab/window
* **Hide this field on publish page** hides the hyperlink in the entry edit form

## Credits

Big thanks to Rowan Lewis' Reflection Field, which comprises about 90% of this code! Thx.