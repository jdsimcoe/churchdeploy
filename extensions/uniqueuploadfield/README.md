# Field: Unique File Upload

This extension, just like the Hashed Upload Field extension by Rowan Lewis, provides an upload field which allows multiple copies of a file to be uploaded to the same location. It will retain the filename and append a unique ID to it.

The extension uses PHP’s preg_replace function and will crop the filename (i.e. w/o file extension) to a fixed length.


## Origin

This extension is a variation of the 'Hashed Upload Field' extension by Rowan Lewis.


## Installation

1. Upload the 'uniqueuploadfield' folder in this archive to your Symphony 'extensions' folder.

2. Enable it by selecting the "Field: Unique File Upload", choose Enable from the with-selected menu, then click Apply.

3. You can now add the "Unique File Upload" field to your sections.


## The Clean Filename

From version 1.6, this extension provides an additional "clean filename" in the XML output (for display purposes).

### Downloading Files with the Clean Filename

If you want to download files named with a clean filename, put the following .htaccess in your upload folder. If the relevant Apache modules are available, your browser will be asked to download the file under its original name.

	Options -Indexes

	<IfModule mod_setenvif.c>
	    <IfModule mod_rewrite.c>
	        <IfModule mod_headers.c>
	            SetEnvIf Request_URI "([^\/]*)(\.[^\.]+)$" FILENAME=$1$2
	            SetEnvIf Request_URI "([^\/]*)(\-[a-f0-9]{13})(\.[^\.]+)$" FILENAME=$1$3
	            Header set "Content-disposition" "attachment; filename=%{FILENAME}e"
	            UnsetEnv FILENAME
	        </IfModule>
	    </IfModule>
	</IfModule>

That way the unique filename can be entirely hidden from users:

* Alice uploads `report.pdf`
* Symphony renames it to `report-4415297e3af8c.pdf`
* Bob still ends up with `report.pdf` on his machine after downloading the file
