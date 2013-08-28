# Export Ensemble

This extension exports your Symphony website.
It is part of the Symphony core download package.

- Version: 2.0.3
- Author: Symphony Team
- Release Date: 1 July 2013
- Requirements: Symphony 2.3 or above. The `Download ZIP` feature requires the ZIP module for PHP (`--enable-zip`)

## Synopsis

This extension will create an installable version of your Symphony install useful for distribution. The resultant archive contains an install directory with a `install/includes/config_default.php`, `install/includes/install.sql` and `workspace/install.sql` files. This is how official Symphony releases are created.

The ZIP module of PHP is utilised, and is memory efficient, allowing for larger sites to be exported without the need for increasing PHP's memory limit.

This extension adds "Save Install Files" and "Download ZIP" buttons to the preferences page.

## Installation & Updating

Information about [installing and updating extensions](http://getsymphony.com/learn/tasks/view/install-an-extension/) can be found in the Symphony documentation at <http://getsymphony.com/learn/>.

## Usage

The Export Ensemble extension is able to save all tables needed to recreate the entire site, excluding sensitive author data and cache data. There are two options for creating ensembles: `Save Install Files` or `Download ZIP`. If you don't have the `ZipArchive` module enabled for PHP, it would still be possible to manually create an ensemble.

Symphony 2.3 introduces the `install` directory, and because of the complexity of the new installer, it is a requirement that a complete `install` directory exist to use the Export Ensemble extension. Pull the official Git repository or download the official ZIP file for the Symphony 2.3 release if you don't already have an `install` directory.

### Save Install Files

Click on the `Save Install Files` on the `System > Preferences` page to update and overwrite the following files in your Symphony install:

- `install/includes/config_default.php`
- `install/includes/install.sql`
- `workspace/install.sql`

By saving your install files it is possible to manually create an ensemble or manage an installable Git repository of your Symphony site. A Git workflow could involve updating and committing the install files to the repository every time there are changes to the structure or data. Or when the site is completed, the install files could be saved to prepare the site to deploy to the production server, for sharing with a development team or for open source distribution, for example. (If deploying to a server, use in combination with the Dump DB extension if you would like to include author data with your project repository, as Symphony author data will not be included in an ensemble.)

### Download ZIP

Click on the `Download ZIP` button to export an ensemble as a ZIP archive. All tables with the table prefix specified in the configuration settings for Symphony (see the value for the `tbl_prefix` property of the `database` array in `manifest/config.php`) will be included in the SQL dump, excluding the following tables:

#### Excluded Database Tables

- `tbl_authors`
- `tbl_cache`
- `tbl_forgotpass`
- `tbl_sessions`

#### Excluded Configuration Settings

- `symphony`
	- `build`
	- `cookie_prefix`
- `general`
	- `useragent`
- `file`
	- `write_mode`
- `directory`
	- `write_mode`
- `database`
	- `host`
	- `port`
	- `user`
	- `password`
	- `db`
	- `tbl_prefix`
- `region`
	- `timezone`
- `email`
	- `default_gateway`
- `email_sendmail`
	- `from_name`
	- `from_address`
- `email_smtp`
	- `from_name`
	- `from_address`
	- `host`
	- `port`
	- `secure`
	- `auth`
	- `username`
	- `password`

#### Excluded Files and Directories

- `.git`
- `.gitignore`
- `.gitmodules`
- `.htaccess`
- `install-log.txt`
- `manifest`

### Manually Create an Ensemble

To manually create an ensemble: 

1. Click on the `Save Install Files` button
2. Copy the `/install` directory
3. Remove all files in the `Excluded Files and Directories` list above
4. Create an archive of the `/install` directory
5. Share your ensemble

**Note**: If you are using the Members extension, be sure to delete all entries in that section before saving the install files or you may be inadvertently sharing sensitive user information with your ensemble. It's up to you whether you want to share the Git repositories, but be careful that you don't include repositories that include sensitive information. Keep in mind that the workspace and each extension may also include hidden files for managing Git repositories.
