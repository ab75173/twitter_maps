
var latOffset = Math.random() * (0.2 - (-0.2)) + (-0.2);
var lngOffset = Math.random() * (0.2 - (-0.2)) + (-0.2);
// var eventLat = 0;
// var eventLng = 0;

// function getEvent() {

//   eventLat = $('#latitude').val();
//   eventLng = $('#longitude').val();


// }
// getEvent();


function initialize() {
  var mapOptions = {
    center: new google.maps.LatLng($('#latitude').val(), $('#longitude').val()),
    zoom: 8
  };
  var map = new google.maps.Map(document.getElementById("map-canvas"),
      mapOptions);
}
google.maps.event.addDomListener(window, 'load', initialize);
google.maps.event.addDomListener(window, 'page:load', initialize);



