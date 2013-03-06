var map = { init: null, gmap: null, addMarker: null, markers: [] }

map.init = function () {
  var nijmegen =  new google.maps.LatLng(51.842867, 5.854622);

  var mapOptions = {
    zoom: 9,
    center: nijmegen,
    mapTypeId: google.maps.MapTypeId.HYBRID
  }
  map.gmap = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);

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

