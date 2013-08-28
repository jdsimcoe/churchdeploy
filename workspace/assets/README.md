# Flat Admin Theme for Symphony 2.3.x

Since I use Symphony for the bulk of my web + client projects, I thought it would be nice to have a better admin theme.

## Setup

### LESS

The repository includes two `.less` files, one called `admin.less` and the other called `debug.less`. The **admin** file is used to provide overrides for the main admin interface while the **debug** file is used to provide overrides for the `debugdevkit` and `profiledevkit` CSS. Both of these LESS files include the mixins and variables I used to create the admin theme.

Some of the colors in the interface were taken from the existing Symphony Admin theme as well as this PLTTS color scheme:

[http://pltts.me/palettes/1930]()

To compile the LESS files using the included Grunt configuration, just ensure that you have NodeJS and Grunt 0.4.1 [installed globally](http://gruntjs.com/getting-started).

## Installation

### Via Extension

There are multiple ways to do an admin CSS override in Symphony. One way is to grab [michael-e's](http://symphonyextensions.com/developers/michael-e/) extension called [Admin CSS Override](http://symphonyextensions.com/extensions/admin_css_override/) and use the CSS file as he instructs.

The only potential downside to this method is that it doesn't allow you to override the `debugdevkit` and `profiledevkit` styles. Follow the instructions below to do this manually.

### Via Hackery

I tried to keep this neat and tidy as I hate hacking with Symphony/Extension core files. I have tested this locally and it works like a gem!

For the standard Admin override, locate the `class.administrationpage.php` file in your `symphony/lib/toolkit` folder. Here is [file on Github](https://github.com/symphonycms/symphony-2/blob/master/symphony/lib/toolkit/class.administrationpage.php).

After line 356 (as of August 27, 2013—this could change!) insert this line reference the folder where your CSS file is located:

`$this->addStylesheetToHead('/workspace/assets/css/admin-override.css', 'screen', 41);`

In my case I placed my override file in `workspace/assets/css`. Just make sure you reference the correct directory for it to work.

Next, locate the `content.debug.php` file ([Github link](https://github.com/symphonycms/debugdevkit/blob/master/content/content.debug.php)) in the `extensions/debugdevkit` folder and look for line 89 (this could change) where it does the the stylesheet inserting. Add this line, referencing your own CSS file:

`$this->addStylesheetToHead(URL . '/workspace/assets/css/devkit-override.css', 'screen', 11);`

Finally, locate the `profile.debug.php` file ([Github link](https://github.com/symphonycms/profiledevkit/blob/master/content/content.profile.php)) in the `extensions/profiledevkit` folder. Find line 110 (this could change) where it does stylesheet insertion. Add this line, again, referencing your own CSS file location:

`$this->addStylesheetToHead(URL . '/workspace/assets/css/devkit-override.css', 'screen', 11);`

## Improving

Feel free to fork this and improve it. Eventually if this style gets developed far enough along, Symphony Core may pick it up and implement it as the main admin theme!

