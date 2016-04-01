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


});//ends page change function var map;


