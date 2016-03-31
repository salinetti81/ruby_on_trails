// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require_tree .
//= require bootstrap-sprockets
//= require underscore
//= require gmaps/google
//= require turbolinks




// COMMENTS SECTION POWERED BY DISQUS
/**
* RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
* LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables
*/

// var disqus_config = function () {
// this.page.url = PAGE_URL; // Replace PAGE_URL with your page's canonical URL variable
// this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
// };
$(document).on("page:change", function() {
        var path = window.location.pathname.split('/')[2]

        console.log(path);

  (function() { // DON'T EDIT BELOW THIS LINE
  var d = document, s = d.createElement('script');

  s.src = '//hikebuddy.disqus.com/embed.js';

  s.setAttribute('data-timestamp', +new Date());
  (d.head || d.body).appendChild(s);
  })();
  //end of disqus closure

  //image uploading by ospry
  var ospry = new Ospry('pk-prod-lcncdvah2hokmvr29hbh5w65');
  console.log(ospry)

  var onUpload = function(err, metadata) {
    ospry.get({
      url: metadata.url,
      maxHeight: 400,
      imageReady: function(err, domImage) {

        var path = window.location.pathname.split('/')[2]

        var data = { image: domImage.src }

        $('body').append(domImage); 

        $.ajax({
          url: '/users/' + path + '/updatejson',
          data: data,
          method: 'PUT'
        }).then(function(result) {
          console.log(result);
          location.reload();
        });
        // make POST request to Users controller
        // to add img url to user
      $.ajax({
          url: '/hikes/' + path + '/updatejson2',
          data: data,
          method: 'PUT'
        }).then(function(result) {
          console.log(result);
          location.reload();
          
        });
      },
    });
  }; // end onupload function

  $('#up-form').submit(function(e) {
    e.preventDefault();
    ospry.up({
      form: this,
      imageReady: onUpload,

    });
  }); // end up-form

handler = Gmaps.build('Google');
handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
  markers = handler.addMarkers([
    {
      "lat": 36.054445,
      "lng": -112.140111,
      "picture": {
        // "url": "http://people.mozilla.com/~faaborg/files/shiretoko/firefoxIcon/firefox-32.png",
        "width":  32,
        "height": 32
      },
      "infowindow": "hello!"
    }
  ]);
  handler.bounds.extendWith(markers);
  handler.fitMapToBounds();
});
// function gmap_show(hike) {
//   if ((hike.lat == null) || (hike.lng == null) ) {    // validation check if coordinates are there
//     return 0;
//   }

//   handler = Gmaps.build('Google');    // map init
//   handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
//     markers = handler.addMarkers([    // put marker method
//       {
//         "lat": hike.lat,    // coordinates from parameter hike
//         "lng": hike.lng,
//         "picture": {    // setup marker icon
//           // "url": 'http://www.planet-action.org/img/2009/interieur/icons/orange-dot.png',
//           "width":  32,
//           "height": 32
//         },
//         "infowindow": "<b>" + hike.name + "</b> " + hike.address + ", " + hike.postal_code + " " + hike.city
//       }
//     ]);
//     handler.bounds.extendWith(markers);
//     handler.fitMapToBounds();
//     handler.getMap().setZoom(12);    // set the default zoom of the map
//   });
// }


// // MAPS

// // PASS RUBY VAR TO JS

//  var hike = #{@hike.to_json}    // pass ruby variable to javascript
//     gmap_show(hike);    // init show map for hike card (only print marker)

//  gmap_form(null);    // form map for new view (print nothing with possibility of put marker)

// function gmap_form(hike) {
//   handler = Gmaps.build('Google');    // map init
//   handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
//     if (hike && hike.lat && hike.lng) {    // statement check - new or edit view
//       markers = handler.addMarkers([    // print existent marker
//         {
//           "lat": hike.lat,
//           "lng": hike.lng,
//           "picture": {
//             // "url": 'http://www.planet-action.org/img/2009/interieur/icons/orange-dot.png',
//             "width":  32,
//             "height": 32
//           },
//           "infowindow": "<b>" + hike.name + "</b> " + hike.address + ", " + hike.postal_code + " " + hike.city
//         }
//       ]);
//       handler.bounds.extendWith(markers);
//       handler.fitMapToBounds();
//       handler.getMap().setZoom(12);
//     }
//     else {    // show the empty map
//       handler.fitMapToBounds();
//       handler.map.centerOn([52.10, 19.30]);
//       handler.getMap().setZoom(6);
//     }
//   });

//   var markerOnMap;

//   function placeMarker(location) {    // simply method for put new marker on map
//     if (markerOnMap) {
//       markerOnMap.setPosition(location);
//     }
//     else {
//       markerOnMap = new google.maps.Marker({
//         position: location,
//         map: handler.getMap()
//       });
//     }
//   }

//   google.maps.event.addListener(handler.getMap(), 'click', function(event) {    // event for click-put marker on map and pass coordinates to hidden fields in form
//     placeMarker(event.latLng);
//     document.getElementById("map_lat").value = event.latLng.lat();
//     document.getElementById("map_lng").value = event.latLng.lng();
//   });
// }







});//ends page change function var map;


