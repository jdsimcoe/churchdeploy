# Debug Devkit

A debug panel for Symphony.
It is part of the Symphony core download package.

- Version: 1.2.3
- Date: 22nd February 2013
- Requirements: Symphony 2.2 or later
- Author: Rowan Lewis, Symphony Team

## Usage

Append `?debug` to your front-end pages when logged in to initialise this Devkit. The Debug Devkit responds to the following URL's:

- `?debug=xml`: Default view, shows a syntax highlighted XML tree of the front-end page with XPath support
- `?debug=raw`: The raw XML of the current page
- `?debug=result`: The result of the front-end page after it has been transformed with XSLT
- `?debug=params`: The parameters of the current page, both from the system and from data sources.