

class Map


  constructor: -> @map()


  map: =>
    styles = [
      {
        featureType: "all"
        elementType: "all"
        stylers: [
          saturation: -50
          #lighten: 20
          #gamma: .7
          #visibility: "simplified"
        ]
      },{
        featureType: "road"
        elementType: "geometry"
        stylers: [
          visibility: "simplified"
        ]
      },{
        featureType: "road"
        elementType: "labels"
        stylers: [
          #visibility: "off"
        ]
      }
    ]
    styledMap = new google.maps.StyledMapType styles, name: "Styled Map"
    @map = new google.maps.Map(
      document.getElementById("map_canvas"),
        mapTypeId: google.maps.MapTypeId.ROADMAP
        scrollwheel: false
        minZoom: 4
        mapTypeControl: false
        mapTypeControlOptions:
          mapTypeIds: [
            google.maps.MapTypeId.ROADMAP,
            "map_style"
          ]
        #zoom: 13
        #center: new google.maps.LatLng(-33.92, 151.25)
        #maxZoom: 5
        #navigationControl: false
        #scaleControl: false
        #draggable: false
    )
    @bounds = new google.maps.LatLngBounds()
    @locations = []
    @latlngs = $(".map .locations .location")
    @mark latlng for latlng in @latlngs
    @map.mapTypes.set "map_style", styledMap
    @map.setMapTypeId "map_style"
    @map.fitBounds @bounds
    @map.panToBounds @bounds


  mark: (latlng) =>
    location = new google.maps.LatLng $(latlng).data("lat"), $(latlng).data("lng")
    @locations.push location
    #MyOverlay = {}
    #MyOverlay = new google.maps.OverlayView()
    #MyOverlay.prototype.onAdd = ->
    #MyOverlay.prototype.onRemove = ->
    #MyOverlay.prototype.draw = ->
    #console.log MyOverlay
    #MyOverlay = (map) -> setMap @map
    #overlay = new MyOverlay @map
    #point = this.getProjection().fromLatLngToDivPixel location
    marker = new google.maps.Marker
      position: location
      map: @map
      title: $(latlng).data("title")
    infoWindowHtml = $(latlng).find(".info-window-container").html()
    $(latlng).find(".info-window-container").remove()
    infoWindow = new google.maps.InfoWindow content: infoWindowHtml
    @bounds.extend location
    google.maps.event.addListener marker, "click", ->
      infoWindow.open @map, marker
      @map.panTo marker.getPosition()
    #google.maps.event.addListener @map, "idle", ->
    #  projection = overlay.getProjection()
    #  console.log projection
    #google.maps.event.addListener marker, "mouseover", ->
    #  infoWindow.open @map, marker


  toggleBounce: =>
    if marker.getAnimation() != null then marker.setAnimation(null)
    else marker.setAnimation(google.maps.Animation.BOUNCE)


if $(".map").exists() then new Map()

