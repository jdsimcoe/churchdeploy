#### Church Deploy is a robust [Symphony CMS](http://getsymphony.com/) ensemble (template)

The base installation of Church Deploy doesn't come with any components, however they can be easily added. We use the term `component` for a Church Deploy object. A Church Deploy component has a template XSL file, with its component name, and some MySQL queries to add the functionality. The MySQL queries are always at the top of its respective template.

We made an out of the box template for you to work from called `anchor` in which we use the name "Anchor Church." Church Deloy will use whatever theme that you title `active`. So if you want to switch templates, simply go to the templates directory and change the folder name. Church Deploy is designed to have all of the core functionalty and let your theme template files simply make only the changes that are unique to your installation.

All of the components we used are free for you to use as Church Deploy is a combination of open-source projects.

Please write [kirk@strobeck.com](mailto:kirk@strobeck.com), IM kirkstrobeck on AIM/Skype, or call (503) 427-8050 if you have any questions.  
We are excited to see how you use Church Deploy and how the project grows!

## Installation

Use the example organization [anchorchurch](https://github.com/anchorchurch), which contains a [theme](https://github.com/anchorchurch/anchor) and a [site](https://github.com/anchorchurch/churchdeploy) project. The theme should be like the [anchor theme](https://github.com/anchorchurch/anchor) and the [site](https://github.com/anchorchurch/churchdeploy) should be a [fork](https://github.com/anchorchurch/churchdeploy) of [Church Deploy](https://github.com/churchdeploy/churchdeploy). This will enable you to push updates directly to your server by installing git via SSH and using `git pull` to update your live site. The site project is your theme combined with the core Church Deploy ensemble.

Once you fork [Church Deploy](https://github.com/churchdeploy/churchdeploy), you can update it

    git remote add upstream https://github.com/churchdeploy/churchdeploy.git
    git fetch upstream
    git merge upstream/master
    git push
    
To add your [theme](https://github.com/anchorchurch/anchor) to your [fork](https://github.com/anchorchurch/churchdeploy) in the [themes](https://github.com/anchorchurch/churchdeploy/tree/master/workspace/themes) directory as *active*
    
    git submodule add -f https://github.com/anchorchurch/anchor.git workspace/themes/active/
    
To clone a [site](https://github.com/anchorchurch/churchdeploy) project, remember to get the [submodule](https://github.com/anchorchurch/churchdeploy/tree/master/workspace/themes) by using the *recursive* flag

	git clone https://github.com/anchorchurch/churchdeploy.git --recursive

#### Server requirements

- PHP 5.3
- PHP's LibXML module, with the XSLT extension enabled (--with-xsl)
- MySQL 5.0 or later
- Apache webserver with mod_rewrite


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

## Components

#### Downloads

#### Images

#### Locations

#### Tags

#### Text

#### Twitter

#### Verses

#### Videos

#### Featured

#### Events

#### Events: Recurring

#### Events: Types

#### Teachings

#### Teachings: Series

#### Teachings: Tags

#### Members

#### Members: Roles

#### Members: Roles: Types

#### Alerts


## Core

#### Layouts

#### Sections

#### Misc

#### Status


## Walkthru

We make no assumptions about how you will use Church Deploy. It is up to you to craft whatever solution is best for your use-case. We are doing our best to keep the core robust and controllable, so you can enable or disable different components. 
