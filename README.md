# Church Deploy

A robust [Symphony CMS](http://getsymphony.com/) ensemble (template) for churches.

## Quick install

1. [Download](https://github.com/churchdeploy/churchdeploy/archive/master.zip) the Church Deploy core
3. [Download](https://github.com/anchorchurch/anchor/archive/master.zip) the example *Anchor* theme, rename the folder to `active`, and move it into `workspace/themes`
4. Start a server using something like [MAMP](http://www.mamp.info/en/index.html)
5. Connect to MAMP MySQL using something like [Sequel Pro](http://www.sequelpro.com/) and create a database with any name.
6. Visit your new server homepage and follow the on-screen installation instructions.

## Getting started

Think of *Content > Tags* as Pages. A tag is a meeting place for content of all kinds. When the content comes together (has the same tag) then it gets displayed according to *Structure > Layouts*, which can be specified in the tag.

If a field says *(internal)* then it won't show on the page, it's for your internal reference only.

All text areas support [Markdown](http://whatismarkdown.com/) .. its awesome :)

Go to `http://your-host/toolkit/images/` to [add images](http://see.kirkstrobeck.com/G7Xl) for use in text fields while utilizing [responsimage](http://responsimage.com/).

Cron jobs need to be added to use twitter, vimeo, and ustream .. see component documentation below for details. The cron job will push the data into the backend CMS automatically.

Get your *auth token* by going to *System > Authors > Your-name*, then check the box next to
ie. Allow remote login via http://atheycreek.com/symphony/login/725e2ffa/
`725e2ffa` is your auth token to use in the cron jobs below.

## Grunt

[Grunt](http://gruntjs.com/) is already installed and configured.  
 
For development (uncompressed), run 

    grunt watch:jsdev & grunt watch:cssdev
    
and for production (compressed), run

    grunt watch:jsprod & grunt watch:cssprod

## Bug tracker

Have a bug? Please create an [issue](https://github.com/churchdeploy/churchdeploy/issues) here on GitHub that conforms with [necolas's guidelines](https://github.com/necolas/issue-guidelines).

# Components

## Downloads

## Images

## Locations

## Tags

## Text

## Twitter

Cron job

    curl http://your-server.com/symphony/extension/xmlimporter/importers/run/twitter/?auth-token=725e2ffa

*Blueprints > XML Importers > Twitter* and check the radio button "Is unique" in the **ID** row under **Destination**

This will update *Content > Twitter*

## Verses

## Videos

Cron job

    curl http://your-server.com/symphony/extension/xmlimporter/importers/run/vimeo/?auth-token=725e2ffa

*Blueprints > XML Importers > Vimeo* and check the radio button "Is unique" in the **ID** row under **Destination**

This will update *Content > Videos*

## Featured

## Events

## Events: Recurring

## Events: Types

## Teachings

## Teachings: Series

## Teachings: Tags

## Members

## Members: Roles

## Members: Roles: Types

## UStream

Cron job

    curl http://your-server.com/symphony/extension/xmlimporter/importers/run/ustream/?auth-token=725e2ffa

*Blueprints > XML Importers > UStream* and check the radio button "Is unique" in the **Name** row under **Destination**

This will update *Structure > Status > ustream-status*

#### Alerts


## Core

#### Layouts

#### Sections

#### Misc

#### Status


## Walkthrough

We make no assumptions about how you will use Church Deploy. It is up to you to craft whatever solution is best for your use-case. We are doing our best to keep the core robust and controllable, so you can enable or disable different components.

## Features

- Tag-based associations create content "meeting points," there aren't really any "pages" per se.
    - All content is associated with a `tag`.
    - Tags claim parents, so a second-tier tag is really just claiming a first-tier tag as its parent, but it is organized to communicate content relationships to the user.
        - Tags can claim multiple parents, so you can position content in different sections, even groups of contant (if tag *A* claims *B* as a parent, then wherever *A* is shown, *B* is shown as a sub-page)
    - Supports infinite nav levels, whether 3 or 300.
- ID-anchored URLs let you change the readable text and not worry about migration issues.
    - Nice URL slugs let you inform the user about the content
    - ie. `site/4234/our-big-meeting/` could change to `site/4234/fun-times-ahead/` without any users lost or confused, as both URLs still function.
- Internal templating, in the Symphony control panel, lets you reorganize content based on your needs. Content can be designed to react to its placement in the templates.
    - ie. If an event is in `full-width` then it will have a more detailed and imformative view than the same event listed in `column-right`, the sidebar.
- Component-based architecture lets you pick and choose your functionality and implementation. It also helps organize code to spot issues more easily.
- Uses [Bootstrap](http://twitter.github.com/bootstrap/) for baseline styles and HTML.
    - Out of the box template is built with many responsive considerations.
- Retina-ready icon font, and [responsimage](http://responsimage.com/) image baked-in.
- Front-end membership is already in-place, and we hope to enable registration soon.

## Advanced installation

Use the example organization [`anchorchurch`](https://github.com/anchorchurch), which consists of two projects ..

1. [`anchor`](https://github.com/anchorchurch/anchor) *theme* — a custom theme bundle (similar to a WordPress theme) for a church we made up for example purposes only.
2. [`churchdeploy`](https://github.com/anchorchurch/churchdeploy) *fork*  — a fork of [`churchdeploy`](https://github.com/churchdeploy/churchdeploy) with the above `anchor` project added as a [submodule](http://symphonyextensions.com/articles/on-git-submodules/) to the path `workspace/themes/active`. Forking the project and adding your theme will enable you to push updates by installing git via SSH on your server and using `git pull` to update your live site.

You can update your local `churchdeploy` fork using the following commands ..

    git remote add upstream https://github.com/churchdeploy/churchdeploy.git
    git fetch upstream
    git merge upstream/master
    git push

### Server requirements

- PHP 5.3
- PHP's LibXML module, with the XSLT extension enabled (--with-xsl)
- MySQL 5.0 or later
- Apache webserver with mod_rewrite

### Software recommendations

- Mac OS X
    - Local server: [MAMP Pro](http://www.mamp.info/en/mamp-pro/index.html) - MAMP is free, pro is $59.00
    - MySQL: [Sequel Pro](http://www.sequelpro.com/) - Donationware
    - Code editor: [Sublime 2](http://www.sublimetext.com/2) - Free demo, $59.00 to buy
    - FTP: [Transmit](http://panic.com/transmit/)

## More

We use the term `component` for a Church Deploy object (in Symphony, objects are called *sections*). All Church Deploy components have a template XSL file, which lives in the *workspace/themes/yourtheme* directory, with its component name.

We made an out of the box template for you to work from called [anchor](https://github.com/anchorchurch/anchor) in which we use the name "Anchor Church." Church Deloy will use whatever theme that you title `active`. So if you want to switch templates, simply go to the templates directory and change the folder name. Church Deploy is designed to have all of the core functionalty in the parent project and let your theme template files only make the changes that are unique to your installation, but it isn't limiting in the least.

All of the components we used are free for you to use with Church Deploy as it is a combination of open-source projects. Thank you open source community!

Please write [kirk@strobeck.com](mailto:kirk@strobeck.com), IM kirkstrobeck on AIM/Skype, or call (503) 427-8050 if you have any questions.

**We are excited to see how you use Church Deploy and how the project grows!**
