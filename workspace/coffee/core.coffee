
# Test if in dom | $(dom).exists()
jQuery.fn.exists = -> jQuery(this).length > 0

# Externalize links
links = $("a")
i = 0
while i < links.length
  links[i].setAttribute "target", "_blank" if links[i].href.indexOf(window.location.hostname) is -1
  i++

# Prepare audio for play
# https://github.com/kolber/audiojs
audiojs.events.ready -> audiojs.createAll()

# Bootstrap alerts
# Enable dismissal of an alert via JavaScript
# http://twitter.github.com/bootstrap/javascript.html
$(".alert").alert()

# Bootstrap carousel
# A generic plugin and component for cycling through elements like a carousel.
# http://twitter.github.com/bootstrap/javascript.html
$(".carousel").carousel()