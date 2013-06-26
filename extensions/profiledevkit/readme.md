# Profile Devkit #

A profile panel for Symphony. It is part of the Symphony core download package.

- Version: 1.2
- Date: 22nd February 2013
- Requirements: Symphony 2.3 or later
- Author: Rowan Lewis, Symphony Team

## Usage

Append `?profile` to your front-end pages when logged in to initialise this Devkit. The Profile Devkit responds to the following URL's:

- `?profile`: Default view, shows an overview of the current page's performance metrics, including number of database queries, memory usage etc.
- `?profile=data-sources`: Outputs how long each data source took to execute and how many database queries were run
- `?profile=events`: Outputs how long each event took to execute and how many database queries were run
- `?profile=delegates`: Displays a breakdown of what delegates were fired in creating this page by extension. Includes how long they took to run and how many queries were executed for each delegate. This requires Symphony 2.3.2.
- `?profile=render-statistics`: A more detailed overview of the page generation times
- `?profile=memory-usage`: Shows a breakdown of the memory usage by data source, event and page generation for the current front-end page
- `?profile=database-queries`: Outputs all database queries that were fired to generate the current page
- `?profile=slow-queries`: Shows all queries that took longer than 0.09s to run