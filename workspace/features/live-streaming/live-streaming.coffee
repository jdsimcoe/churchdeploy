
class LiveStreaming


  constructor: ->
    if $.cookie("alertLive") isnt "hidden"
      $(".alertLive").removeClass "hidden"
    $(".alertLive .close").click ->
      $.cookie "alertLive", "hidden",
        expires: 1
        path: "/"


new LiveStreaming()

