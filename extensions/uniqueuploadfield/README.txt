Field: Unique File Upload
------------------------------------------------------------------------------

Version: 1.4.2
Author: Michael Eichelsdoerfer
Build Date: 2011-08-19
Requirements: Symphony 2

Extension home: http://symphony-cms.com/download/extensions/view/20653/

[Origin]

This extension is a variation of the 'Hashed Upload Field' extension by
Rowan Lewis.

[Installation]

1. Upload the 'uniqueuploadfield' folder in this archive to your Symphony
   'extensions' folder.

2. Enable it by selecting the "Field: Unique File Upload", choose Enable from
   the with-selected menu, then click Apply.

3. You can now add the "Unique File Upload" field to your sections.

[Updating]

There is no special update procedure for this extension if you are using
(or updating to) Symphony > 2.0.6.

(There has been a manual update procedure for all upload fields in earlier
Symphony versions which has been moved to the Symphony updater script.)

[Changes]

1.4.2
- Explicitly set CHARSET and COLLATION when creating the table.

1.4.1
- Fix for REGEXP so it does not break paths stored in `$filename`.

1.4
- Replaced date() by uniqid(), making filenames even more unique.

1.3
- Symphony 2.2 compatibility

1.2
- MySQL5.5 compatibility

1.1
- Added updater function to modify entry tables
  (as required by Symphony > 2.0.8RC3)

1.0
- Added git control

0.9
- Initial release
