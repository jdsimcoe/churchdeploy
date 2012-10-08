# Export Ensemble #

This extension exports your Symphony website.
It is part of the Symphony core download package.

- Version: 1.16
- Date: 18th June 2011
- Requirements: Symphony 2.2 or above. The `Download ZIP` feature requires the ZIP module for PHP (`--enable-zip`).
- Author: Alistair Kearney, alistair@symphony-cms.com
- Constributors: [A list of contributors can be found in the commit history](http://github.com/symphonycms/export_ensemble/commits/master)
- GitHub Repository: <http://github.com/symphonycms/export_ensemble>

## Synopsis

This extension will create an installable version of your Symphony install useful for distribution. The resultant archive contains `install.php`, `install.sql` and `workspace/install.sql` files. This is how all official Symphony releases are created.

The ZIP module of PHP is utilised, and is memory efficient, allowing for larger sites to be exported without the need for increasing PHP's memory limit.

This extension adds "Save Install Files" and "Download ZIP" buttons to the preferences page.

## Installation & Updating

Information about [installing and updating extensions](http://symphony-cms.com/learn/tasks/view/install-an-extension/) can be found in the Symphony documentation at <http://symphony-cms.com/learn/>.

## Usage

The Export Ensemble extension is able to save all tables needed to recreate the entire site, excluding sensitive author data and cache data. There are two options for creating ensembles: `Save Install Files` or `Download ZIP`. If you don't have the ZipArchive module enabled for PHP, it would still be possible to manually create an ensemble. 

### Save Install Files

Click on the `Save Install Files` on the `System > Preferences` page to update and overwrite the following files in your Symphony install:

- `install.php`
- `install.sql`
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
2. Copy the install directory
3. Remove all files in the `Excluded Files and Directories` list above
4. Create an archive of the install directory
5. Share your ensemble

**Note**: If you are using the Members extension, be sure to delete all entries in that section before saving the install files or you may be inadvertently sharing sensitive user information with your ensemble. It's up to you whether you want to share the Git repositories, but be careful that you don't include repositories that include sensitive information. Keep in mind that the workspace and each extension may also include hidden files for managing Git repositories.

## Change Log

**Version 1.16**

- Enable creation of install files if they do not already exist

**Version 1.15**

- Dump all tables with `tbl_prefix`
- Exclude email configuration settings
- Save install files (for Git repositories or for manually creating ensembles)
- ZipArchive class is no longer required for install
- Update README with usage instructions

**Version 1.14**

- Dump the `tbl_sessions` table structure

**Version 1.13**

- Use the current Symphony install configuration values instead of always using the defaults
- Export Ensemble is now dynamic and uses the the current Symphony version instead of being hardcoded

**Version 1.12**

- Compatibility changes for 2.2
- Fix markup bug

**Version 1.11**

- Compatibility changes for 2.0.7RC2

**Version 1.10**

- Added localisation files for Dutch, German, Portuguese (Brazil) and Russian

**Version 1.9**

- Misc code cleanup
- Minor changes to ensure compatibility with PHP v5.3.x

**Version 1.8**

- Any file that matches '/README.*' will be added to the archive along with '/README' if it exists.

**Version 1.7**

- Fixed order in which items are added to the zip so the new 'workspace/install.sql' file overrides any existing one

**Version 1.6**

- Creates separate SQL files. install.sql and workspace/install.sql

**Version 1.5**

- README and LICENCE are correctly added to the archives

**Version 1.3**

- Changed call to pageAlert to make easier to translate and conform with 2.0.1 guidelines

**Version 1.2**

- install() function properly checks for the ZipArchive class and returns true if found, allowing installation

**Version 1.1**

- Moved "installer.tpl", found in the main S2 repository, into the /lib folder
