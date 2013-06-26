# Select Box Link Field

- Version: 1.26
- Author: Symphony Team
- Release Date: 22nd February 2012
- Requirements: Symphony 2.3.2 or greater

## Installation

1. Upload the `selectbox_link_field` folder in this archive to your Symphony 'extensions' folder.
2. Enable it by selecting the "Field: Select Box Link", choose Enable from the with-selected menu, then click Apply.
3. You can now add the "Select Box Link" field to your sections.

## Updating

1. Be sure to visit the Extension page in the Symphony admin and enable "Select Box Link Field" so the database is updated accordingly.

## Usage

- Works in a near identical way to the standard select box field, however there is no static options and entries are linked internally via their ID, meaning that if an entry is changed, any Select Box Link fields will not lose their link to that entry. The data on the front-end is presented in a way identical to that of a Section Link.

- Setting an instance of the field to be not required will cause an empty option to show up on the publish form.

## Filtering options

The Select Box Link supports the following filtering options in your data sources:

- `Red Cats` or `not: Red Cats`: Return all entries where the linked entry has the value of `Red Cats` (or does not have the value `Red Cats`)
- `red-cats` or `not: red-cats`: Return all entries where the linked entry has the handle of `red-cats` (or does not have the handle `red-cats`)
- `1` or `not: 1`: Return all entries where the linked entry ID is `1`, (or is not `1`)
- `sql-null-or-not: 1`: Return all entries where the linked entry ID is not 1 or the entry has no linked entries.
- `sql: NULL`: Return all entries that do not have any linked entries
- `sql: NOT NULL`: Return all entries that have a linked entry

Please note that predicate filters, such as `not:` or `sql:`, will ignore all other [data source filters](http://symphony-cms.com/learn/concepts/view/data-source-filters/) for that field.