var map;
var circle;

function offset(num) {
    return Math.random() * (num)
}

function initialize() {
  var mapOptions = {
    center: new google.maps.LatLng(parseFloat($('#latitude').val()),parseFloat($('#longitude').val())),
    zoom: 9,
    scrollwheel: false,
    disableDefaultUI: true,
    draggable: false,
    panControl: false,
    zoomControl: false,
    disableDoubleClickZoom: true,
    styles: mapStyle,
    };

  map = new google.maps.Map(document.getElementById("map-canvas"),
      mapOptions);

  circle = new google.maps.Circle({
      map: map,
      center: new google.maps.LatLng(parseFloat($('#latitude').val()),parseFloat($('#longitude').val())),
      radius: 50000
    });
}
google.maps.event.addDomListener(window, 'load', initialize);
google.maps.event.addDomListener(window, 'page:load', initialize);


var firstZoom = window.setTimeout(function(){
    console.log('zoom');
    map.setZoom(13);
    circle.setRadius(3000)
} , 3000)

var secondZoom = window.setTimeout(function(){
    console.log('zoom 2');
    map.setZoom(15);
    circle.setRadius(800)
} , 6000)

var finalZoom = window.setTimeout(function(){
    console.log('zoom final');
    var lat = parseFloat($('#latitude').val());
    var lng = parseFloat($('#longitude').val());
    var loc = new google.maps.LatLng(lat, lng);
    map.setCenter(loc);
    map.setZoom(17);
    circle.setRadius(3)
    var marker = new google.maps.Marker({
      position: loc,
      map: map,
      title: 'PARTY!'
  });
    $('#event_address').removeClass('visuallyhidden');
} , 9000)


var mapStyle = [
    {
        "featureType": "water",
        "stylers": [
            {
                "color": "#19a0d8"
            }
        ]
    },
    {
        "featureType": "administrative",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "color": "#ffffff"
            },
            {
                "weight": 6
            }
        ]
    },
    {
        "featureType": "administrative",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#e85113"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "color": "#efe9e4"
            },
            {
                "lightness": -40
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "color": "#efe9e4"
            },
            {
                "lightness": -20
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "lightness": 100
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "lightness": -100
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "labels.icon"
    },
    {
        "featureType": "landscape",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "landscape",
        "stylers": [
            {
                "lightness": 20
            },
            {
                "color": "#efe9e4"
            }
        ]
    },
    {
        "featureType": "landscape.man_made",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "lightness": 100
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "lightness": -100
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "hue": "#11ff00"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "lightness": 100
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "labels.icon",
        "stylers": [
            {
                "hue": "#4cff00"
            },
            {
                "saturation": 58
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "geometry",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "color": "#f0e4d3"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#efe9e4"
            },
            {
                "lightness": -25
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#efe9e4"
            },
            {
                "lightness": -10
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "simplified"
            }
        ]
    }
];
