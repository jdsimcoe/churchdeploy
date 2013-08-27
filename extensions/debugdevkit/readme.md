# Debug Devkit

The Debug Devkit allows a developer to preview the XML of a Frontend page. It also includes the page parameters, included XSL templates and provides a navigation for other Devkit extensions (such as the Profile Devkit)

- Version: 1.2.4
- Author: Rowan Lewis, Symphony Team
- Release Date: 1 July 2013
- Requirements: Symphony 2.2 or greater

## Usage

Append `?debug` to your front-end pages when logged in to initialise this Devkit. The Debug Devkit responds to the following URL's:

- `?debug=xml`: Default view, shows a syntax highlighted XML tree of the front-end page with XPath support
- `?debug=raw`: The raw XML of the current page
- `?debug=result`: The result of the front-end page after it has been transformed with XSLT
- `?debug=params`: The parameters of the current page, both from the system and from data sources.