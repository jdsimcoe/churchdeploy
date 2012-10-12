(($, document, window, audiojs) ->
  "use strict"
  $ ->
    $.fn.exists = ->
      $(this).length > 0

    $(document).ready ->
      isPlaceholderSupported = ->
        input = document.createElement("input")
        "placeholder" of input
      audiojs.events.ready ->
        audiojs.createAll()

      $(".downloadPopover").hover ->
        $(this).popover "toggle"

      hostName = window.location.hostname
      links = $("a")
      alertLiveCookie = $.cookie("alertLive")
      i = 0
      if alertLiveCookie isnt "hidden"
        $(".alertLive").removeClass "hidden"
        $(".alertLive .close").click ->
          $.cookie "alertLive", "hidden",
            expires: 1
            path: "/"

      $(".alert").alert()
      $(".carousel").carousel()
      placeholdersupport = isPlaceholderSupported()
      $(".search-query").val "Search"  if placeholdersupport is false
      $(".search-query").focus ->
        $(this).val ""  if $(this).val() is "Search"  if placeholdersupport is false

      $(".search-query").blur ->
        $(this).val "Search"  if $(this).val() is ""  if placeholdersupport is false

      $(".modalLiveLink").click (e) ->
        e.preventDefault()
        $(".modalLive").modal "show"
        false

      $(".modalLive .close").click (e) ->
        e.preventDefault()
        $(".modalLive").modal "hide"
        false

      $(".modalLive").on "show", ->
        url = $(".modalLive .modal-body .url").html()
        $(".modalLive .modal-body .ustream-embed").html "<iframe src=\"" + url + "\" width=\"600\" height=\"363\" scrolling=\"no\" frameborder=\"0\" style=\"border: 0px none transparent;\"></iframe>"

      $(".modalLive").on "hidden", ->
        $(".modalLive .modal-body .ustream-embed").html "#"
        $(".modalLive").hide()

      i = 0
      while i < links.length
        links[i].setAttribute "target", "_blank"  if links[i].href.indexOf(hostName) is -1
        i += 1


) jQuery, document, window, audiojs