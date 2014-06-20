var map;
var circle;
var latitude = 38.904930;
var longitude = -77.034319;
var plusOrMinusFirst = Math.random() < 0.5 ? -1 : 1;
var plusOrMinusSecond = Math.random() < 0.5 ? -1 : 1;
var event_marker;

function initialize() {
  var mapOptions = {
    center: new google.maps.LatLng(latitude, longitude),
    zoom: 9,
    scrollwheel: false,
    disableDefaultUI: true,
    draggable: false,
    panControl: false,
    zoomControl: false,
    disableDoubleClickZoom: true,
    styles: mapStyle
    };

  map = new google.maps.Map(document.getElementById("map_canvas"),
      mapOptions);

  circle = new google.maps.Circle({
      map: map,
      center: new google.maps.LatLng(latitude, longitude)
    });
}
google.maps.event.addDomListener(window, 'load', initialize);
(function()
{
  if( window.localStorage )
  {
    if( !localStorage.getItem( 'firstLoad' ) )
    {
      localStorage[ 'firstLoad' ] = true;
      window.location.reload();
    }
    else
      localStorage.removeItem( 'firstLoad' );
  }
})();

loop();

function loop() {
    window.setTimeout(function(){
        var loc = new google.maps.LatLng(latitude, longitude);
        event_marker.setMap(null);
        circle.setRadius(0)
        map.setCenter(loc);
        map.setZoom(9);
    } , 2000)

    window.setTimeout(function(){
        var lat = latitude + (plusOrMinusFirst * (Math.random() * 0.033));
        var lng = longitude + (plusOrMinusSecond * (Math.random() * 0.027));
        var loc = new google.maps.LatLng(lat, lng);
        map.setCenter(loc);
        map.setZoom(13);
    } , 4000)

    window.setTimeout(function(){
        var lat = latitude + (plusOrMinusFirst * (Math.random() * 0.0059));
        var lng = longitude + (plusOrMinusSecond * (Math.random() * 0.006));
        var loc = new google.maps.LatLng(lat, lng);
        map.setCenter(loc);
        map.setZoom(15);
    } , 6000)

    window.setTimeout(function(){
        var loc = new google.maps.LatLng(latitude, longitude);
        map.setCenter(loc);
        map.setZoom(17);
        circle.setRadius(20)
          event_marker = new google.maps.Marker({
          position: loc,
          map: map,
          title: 'PARTY!'
        });
    } , 8000)
}

var loopZoom = window.setInterval(loop, 8500)

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
