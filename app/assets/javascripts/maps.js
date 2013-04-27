var map = { 
  init: null,
  gmap: null,
  addCamping: null,
  markers: [],
  setCenter: null,
  center: null,
  setup: null,
  fetchCampings: null
}

map.setup = function () {
  //!urlParam("test") testing extension to allow for testing.
  if (Modernizr.geolocation && !urlParam('test')) {
    navigator.geolocation.getCurrentPosition(map.init)
  }
  else {
    var position = { coords: { latitude: '51.71154', longitude: '6.05034' }};
    map.init(position);
  }
}

map.init = function (position) {
  map.setCenter(position);

  var mapOptions = {
    zoom: 6,
    center: map.center,
    mapTypeId: google.maps.MapTypeId.HYBRID
  }
  map.gmap = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);

  new google.maps.Marker({
    position: map.center,
    map: map.gmap,
    title: "You are here!",
    icon: new google.maps.MarkerImage("https://chart.googleapis.com/chart?chst=d_map_pin_icon_withshadow&chld=home|FFFF00")
  });
  google.maps.event.addListener(map.gmap, 'idle', map.fetchCampings)
}

map.addCamping = function (camping) {
  var coords = new google.maps.LatLng(camping.latitude, camping.longitude);
  var gmarker = new google.maps.Marker({
      position: coords,
      map:      map.gmap,
      title:    camping.title
  });
  //Add to internal memory for deleting
  map.markers.push(gmarker)

  var gInfoWindow = new google.maps.InfoWindow({
      content:  camping.infowindow
  });
  google.maps.event.addListener(gmarker, 'click', function() {
    gInfoWindow.open(map.gmap, gmarker);
  });
  $("#campings").append(camping.listing);
}

map.setCenter = function (position) {
  map.center = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
}

map.fetchCampings = function (data) {
  if (data) {
    data = data + "&bounding=" + map.gmap.getBounds().toUrlValue();
  }
  else {
    data = "bounding=" + map.gmap.getBounds().toUrlValue();
  }

  $("#campings").fadeTo('slow', 0.4)
  $.ajax({
    dataType: "json",
    url: "maps.json",
    data: data,
  }).done(function (data) {
    $("#campings").empty();
    //empty markers on map.
    map.markers.forEach(function (marker) {
      marker.setMap(null);
    });

    data.forEach(function (camping) {
      map.addCamping(camping);
    });
    $("#campings").fadeTo('slow', 1)
  });
}

$(document).ready(function () {
  $("#camping_search").submit(function(e) {
    e.preventDefault();
    map.fetchCampings($(this).serialize());
  });
});
