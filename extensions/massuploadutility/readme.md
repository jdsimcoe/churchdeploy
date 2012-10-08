# Mass Upload Utility

- Version: 0.9.8
- Date: 31 May 2011
- Requirements: Symphony 2.2
- Author: Scott Tesoriere <scott@tesoriere.com>
- Github Repository: http://github.com/scottkf/massuploadutility

THIS REQUIRES AN HTML5 COMPATIBLE BROWSER

If you're using an older version of Symphony, please use v0.9 of the Mass Upload Utility:
https://github.com/scottkf/massuploadutility/tree/v0.9

## Purpose

A symphony extension to allow you to add a folder of files into a section that 
has an upload field, it *should* work with all upload fields. Testing is needed.

## Changelog

**v0.9.8**

- Displaying JSON accidently

**v0.9.7**

- Wasn't properly handling a redirect, should be taken care of, thanks David!

**v0.9.6.**

- Properly fires the backend events: _EntryPreCreate_ and _EntryPostCreate_
- Backend stuff, no longer uses event, uses the built in actionNew function of contentPublish

**v0.9.5**

- No longer clears files from the input[file] box if failed
- Under the hood changes, no longer duplicates Symphony code, uses a custom event to add entries.
	Inspiration and thanks to Nick Dunn and his REST API extension!
- Will highlight which fields have problems and display errors on them (except the upload field)
	This may get obnoxious and I might turn it off. This is instead of showing them in the queue list.
	It's customizable by changing a variable in the javascript.
	
**v0.9.4** 

- Under the hood changes, internal

**v0.9.3**

- Reversed the order of the way the queue is populated (so it should be alphabetical now)

**v0.9.2**

- Added ability to exclude sections and users (I stole this from Craig's tracker extension)
- Forgot to localise a couple strings
- A quick blurb to let the user know they can upload multiple files
- Checking for HTML5 support
- Added support for using variables in any other input field, like {$number} will
	dynamically change
- When selecting files, they're populated to the queue so you know you queued files

**v0.9.1**

- Should work with every upload field and custom field
- Flash is no longer used at all, it's pure html5
- Uploading multiple files is nearly
- Added support for localisation (most of the text relies in JS, but there's a couple in php)
- The workflow is now exactly the same as it is for adding a regular entry, with 
	the exception that you can select multiple files, and when you do, thats when
	my utility kicks in.
 
**v0.9.09**

- Uploading via AJAX

**v0.9.03**

- I've integrated html5 into the extension, but if you choose a large amount of files it will timeout
- There is currently no queue or progress bar, it simply posts all the files.
- It should also now work with *ANY* upload field, but I have not tested it yet.
- It no longer uses shell exec.
- It no longer creates a directory in your workspace folder.

## Todo

- Possibly expand the {$} variables to contain other things (like what?)
- Refine the UI some


## Installation

1.  Upload the 'massuploadutility' folder in this archive to your Symphony
  'extensions' folder.

2.  Enable it by selecting the "Mass Upload Utility", choose Enable from 
  the with-selected menu, then click Apply.


## Usage

1. Go to the index of a section with an upload field
2. Click the button that says 'Create new'
3. If there's an upload field, my script will turn on, select multiple files,
	enter other values as necessary, and click 'Create Entry'


## Bugs/Features

- If more than one upload field is in a section, this will not get used
	I consider this more a feature.
