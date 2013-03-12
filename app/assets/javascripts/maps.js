var map = { 
  init: null,
  gmap: null, 
  addMarker: null,
  markers: [], 
  setCenter: null,
  center: null,
  setup: null,
  fallback: null
}

map.setup = function () {
  if (urlParam('latitude') && urlParam('longitude')) {
    var latitude = urlParam('latitude');
    var longitude = urlParam('longitude');
    if (urlParam('test')) { //testing extension, bail out and render the center instead of initializing map.
      $("#map_canvas").html("latitude: "+ latitude +" longitude: "+ longitude);
      return null;
    }
    else {
      var position = {"coords" : { "latitude": latitude, "longitude": longitude }};
      map.setCenter(position);
    }
  }
  else {
    if (Modernizr.geolocation) {
      navigator.geolocation.getCurrentPosition(map.init)
    }
    else {
      var position = { coords: { latitude: '48.6908333333', longitude: '9.14055555556' }};
      map.init(position);
    }
  }
}

map.init = function (position) {
  map.setCenter(position);

  var mapOptions = {
    zoom: 9,
    center: new google.maps.LatLng(map.center.latitude, map.center.longitude),
    mapTypeId: google.maps.MapTypeId.HYBRID
  }
  map.gmap = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);

  new google.maps.Marker({
    position: new google.maps.LatLng(map.center.latitude, map.center.longitude),
    map: map.gmap,
    title: "You are here!",
    icon: new google.maps.MarkerImage("https://chart.googleapis.com/chart?chst=d_map_pin_icon_withshadow&chld=home|FFFF00")
  });

  map.markers.forEach (function (marker){
    new google.maps.Marker({
      position: new google.maps.LatLng(marker.latitude, marker.longitude),
      map: map.gmap,
      title: marker.title
    });
  });
}

map.addMarker = function (latitude, longitude, title) {
  map.markers.unshift({latitude: latitude, longitude: longitude, title: title});
}

map.setCenter = function (position) {
  map.center = {latitude: position.coords.latitude, longitude: position.coords.longitude}
}
