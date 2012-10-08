# Maintenance Mode #

This extension enables a Maintenance mode for Symphony.  
It is part of the Symphony core download package.

- Version: 1.5
- Date: 8th August 2011
- Requirements: Symphony 2.2
- Author: Alistair Kearney, alistair@symphony-cms.com, and the Symphony Team, team@symphony-cms.com
- Constributors: [A list of contributors can be found in the commit history](http://github.com/symphonycms/maintenance_mode/commits/master)
- GitHub Repository: <http://github.com/symphonycms/maintenance_mode>

## Synopsis

Maintenance mode will block all front-end pages from being viewed unless logged in via the administration area. This is particularly useful if you need to edit your site without visitors seeing missing or incomplete pages.

## Installation & Updating

Information about [installing and updating extensions](http://symphony-cms.com/learn/tasks/view/install-an-extension/) can be found in the Symphony documentation at <http://symphony-cms.com/learn/>.

## Change Log

**Version 1.4**

- Update to use `SYMPHONY_URL` constant (breaks compatibility with Symphony versions prior to 2.2)
- Added Romanian translation

**Version 1.4**

- Added page type "maintenance" to the suggestion list
- Fixed error handling
- Removed empty language files
- Updated included translations

**Version 1.3**

- Made extension responsible for it's own Configuration settings
- Updated to use the Symphony constants instead of `$this->_Parent`

**Version 1.2**

- Added missing translation strings
- Added localisation files for Dutch, German, Portuguese (Brazil) and Russian 

**Version 1.1**

- Changed call to pageAlert to make easier to translate and conform with 2.0.1 guidelines
