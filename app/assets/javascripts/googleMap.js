var map;
var plusOrMinusFirst = Math.random() < 0.5 ? -1 : 1;
var plusOrMinusSecond = Math.random() < 0.5 ? -1 : 1;

function initialize() {
  var mapOptions = {
    center: new google.maps.LatLng(latitude,longitude),
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
      center: new google.maps.LatLng(latitude, longitude),
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
//the below listener may not be necessary?
//google.maps.event.addDomListener(window, 'page:load', initialize);

window.setTimeout(function(){
  if(count >= tweet_goal/3) {
    var lat = latitude + (plusOrMinusFirst * (Math.random() * 0.033));
    var lng = longitude + (plusOrMinusSecond * (Math.random() * 0.027));
    var loc = new google.maps.LatLng(lat, lng);
    map.setCenter(loc);
    map.setZoom(13);
    $('#event_clue_one').removeClass('visuallyhidden');
  }
} , 1500)

window.setTimeout(function(){
  if(count >= (tweet_goal * 2/3)) {
    var lat = latitude + (plusOrMinusFirst * (Math.random() * 0.0059));
    var lng = longitude + (plusOrMinusSecond * (Math.random() * 0.006));
    var loc = new google.maps.LatLng(lat, lng);
    map.setCenter(loc);
    map.setZoom(15);
    $('#event_clue_two').removeClass('visuallyhidden');
  }
} , 2500)

window.setTimeout(function(){
    if(count >= tweet_goal) {
      var lat = latitude;
      var lng = longitude;
      var loc = new google.maps.LatLng(lat, lng);
      map.setCenter(loc);
      map.setZoom(17);
      circle.setRadius(30);
      var marker = new google.maps.Marker({
        position: loc,
        map: map,
        title: 'PARTY!'
      });
      $('#event_clue_one').addClass('visuallyhidden');
      $('#event_clue_two').addClass('visuallyhidden');
      $('#event_address').removeClass('visuallyhidden');
    }
} , 4000)

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
