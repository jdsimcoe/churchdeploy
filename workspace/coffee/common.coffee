

jQuery.fn.exists = -> jQuery(this).length > 0 # usecase $(dom).exists() to test if in dom


$(window).load ->
  if $(".map").exists() then new Map()
  if $(".layout-account").exists() then new Account()

