# Health check

- Version: 1.4
- Author: Phill Gray
- Build Date: 2011-07-18
- Requirements: Symphony 2.2.1

## Installation

- Upload the 'health_check' folder to your Symphony 'extensions' folder.
- Enable it by selecting "Health Check", choose Enable from the with-selected menu, then click Apply.

## Usage

This allows for easy checking of directories that require read/write permissions.

It runs a test against your server to determine the best permissions for your environment. If it fails, then it defaults to Symphony defaults of 0755 for directories and 0644 for files.

This also allows for integration with (Nick Dunn's Dashboard extension)[https://github.com/nickdunn/dashboard]. Simply add the Health Check Panel on the Dashboard page to display directories.

It lists your manifest/cache and manifest/tmp folders as well as any directories specified in any section using the inbuilt Upload Field or the Unique Upload Field.

- **0600** Read and write for owner, nothing for everybody else
- **0644** Read and write for owner, read for everybody else
- **0750** Everything for owner, read and execute for owner's group
- **0755** Everything for owner, read and execute for others
- **0777** Everything for everyone

You can change the permissions by selecting the item, clicking the 'with selected...' checkbox and selecting the permissions you need (This will almost always be 0777). Click apply and it will update for you.

Also, if the manifest folders don't exist, a create button will appear in the top right. Use this to create the missing directory.

**NOTE: The update options will not work if you are not the current user. The current user is the user under which PHP runs. It is probably not the same user you use for normal shell or FTP access. The mode can be changed through this method only by the user who owns the file on most systems. If this is not the case then it will need to be changed via sudo command line or through your Control Panel.**
