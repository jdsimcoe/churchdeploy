# Markdown #

This extension provides Markdown formatting for fields.
It is part of the Symphony core download package.

- Version: 1.13
- Date: 29th January 2011
- Requirements: Symphony 2.0.7+
- Author: Alistair Kearney, alistair@symphony-cms.com
- Constributors: [A list of contributors can be found in the commit history](http://github.com/pointybeard/markdown/commits/master)
- GitHub Repository: <http://github.com/pointybeard/markdown>

## Synopsis

Format text using [Markdown](http://daringfireball.net/projects/markdown/) syntax. This release also passes any output through the [HTML Purifier](http://htmlpurifier.org/) library.

## Installation & Updating

Although the update should address this, fields that used a previous version (< 1.10) may appear to have no formatter specified and will need to be set manually.

Information about [installing and updating extensions](http://symphony-cms.com/learn/tasks/view/install-an-extension/) can be found in the Symphony documentation at <http://symphony-cms.com/learn/>.


## Change Log

**Version 1.12**
- Bugfix to correctly use Markdown Extra parser when required instead of vanilla Markdown.

**Version 1.11**
- Added back the "Markdown Extra" and "Markdown Extra with SmartyPants" formatters. The "Markdown with HTML Purifier" does not use the Extra or SmartyPants libraries.

**Version 1.10**

- Using updated PHP Markdown library. v1.2.4
- Added [HTML Purifier](http://htmlpurifier.org/) v4.0.0 to help prevent XSS and other attacks on input

