"use strict"
$(document).ready ->
  # $.fn.exists -> $(this).length > 0
  audiojs.events.ready -> audiojs.createAll()
  $('.downloadPopover').hover -> $(this).popover('toggle')
  hostName = window.location.hostname
  links = $("a")
  alertLiveCookie = $.cookie("alertLive")
  if alertLiveCookie isnt "hidden"
    $(".alertLive").removeClass("hidden")
    $(".alertLive .close").on "click", -> $.cookie "alertLive", "hidden", { expires: 1, path: "/" }
  $(".alert").alert()
  $('.carousel').carousel()
  placeholdersupport = false
  isPlaceholderSupported -> # use modernizr for this
    input = document.createElement("input")
    placeholdersupport = ('placeholder' in input)
  $('.search-query').val('Search') unless isPlaceholderSupported()
  $('.search-query').focus -> if not placeholdersupport and $(this).val() is 'Search' then $(this).val('')
  $('.search-query').blur -> if not placeholdersupport and not $(this).val().length then $(this).val('Search')
  $(".modalLiveLink").on "click", (e) -> e.preventDefault(); $(".modalLive").modal("show")
  $(".modalLive .close").on "click", (e) -> e.preventDefault(); $(".modalLive").modal("hide")
  $(".modalLive").on "show", ->
    url = $(".modalLive .modal-body .url").html()
    $(".modalLive .modal-body .ustream-embed").html """
    <iframe src="#{url}" width="600" height="363" scrolling="no" frameborder="0" style="border: 0px none transparent"></iframe>
    """
  $(".modalLive").on "hidden", ->
    $(".modalLive .modal-body .ustream-embed").html("#")
    $(".modalLive").hide()
  targetBlank (link) -> if link.href.indexOf(hostName) is -1 then link.setAttribute "target", "_blank"
  targetBlank link for link in links