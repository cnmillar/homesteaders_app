// REMOVE FROM APPLCATION.JS

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require social-share-button
//= require jquery.raty
//= require ratyrate
//= require jquery.paging
//= require new_comment
//= require_self

$(function($){

// Slick carousel
  $('.carousel').slick({
    autoplay: true,
    infinite: true,
    arrows: true,
    speed: 700,
    fade: true,
    cssEase: 'linear'
  });

// Video timeline marker placement
  $('#place-marker').on('click', function( event ) {
    event.preventDefault();
    currentTime = player.getCurrentTime();
    totalTime = player.getDuration();
    percentComplete = currentTime/totalTime;
    //Subtract 10 so that the avatar is centered on the timestamp.
    timelineX = percentComplete*640 - 10;
    //If timelineX is now less than 0, reset to 0
    if (timelineX < 0) {
      timelineX = 0
    }
    var newAvatar = $('<div />').addClass('video-comment-avatar').html('<img src = "https://placekitten.com/g/32/32" />').css({'left': timelineX, 'top' : 0 });
    $('#video-timeline').append(newAvatar);
  });

// Hover state for comment markers
  $('.video-comment').on('mouseenter', function() {
    //comment = '<%= comment.content %>';
    var comment_id = $(this).data('comment-id');
    var comment_content_el = $('#comment_id_' + comment_id);
    var comment_content = comment_content_el.text();
    //console.log('whoa comment content: ' + comment_content.text());
    $('#activeComment').remove();
    hoveredAvatar = $(this);
    avatarFlyout = $('<div />', {
      id: 'activeComment',
      class: 'video-comment-flybelow',
      text: comment_content
    });
    setTimeout(function(){
      hoveredAvatar.append(avatarFlyout).fadeIn(1000);
    }, 200); 
  });

  $('.video-comment').on('mouseleave', function() {
    $("#activeComment").remove();
  });

// Facebook login feature

});

// Load the SDK asynchronously
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
// Here we run a very simple test of the Graph API after login is
// successful.  See statusChangeCallback() for when this call is made.
// function testAPI() {
//   console.log('Welcome!  Fetching your information.... ');
//   FB.api('/me', function(response) {
//     console.log('Successful login for: ' + response.name);
//     document.getElementById('status').innerHTML =
//       'Thanks for logging in, ' + response.name + '!';
//   });
// }

// FB.logout(function(response) {
//       // Person is now logged out
// });

window.fbAsyncInit = function() {
  FB.init({  
    appId      : '1643888345868772',
    xfbml      : true,
    version    : 'v2.4'
  });
};

// });

// Facebook login feature. Extensive comments have been deleted but are available on the Facebook dev site

  // This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);

    if (response.status === 'connected') {
          // $.getJSON('/auth/facebook/callback', function(json) {
          //       });
      'Thanks for logging in, ' + response.name + '!';
      // Logged into your app and Facebook.
     FB.api('/me?fields=id,name,email', function(response) {
        // console.log(JSON.stringify(response));
       });;
    } else if (response.status === 'not_authorized') {
      // The person is logged into Facebook, but not your app.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    } else {
      // The person is not logged into Facebook, so we're not sure if
      // they are logged into this app or not.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into Facebook.';
    }
  }
  // This function is called when someone finishes with the Login
  // Button.  See the onlogin handler attached to it in the sample
  // code below.
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1643888345868772',
      cookie     : true,  // enable cookies to allow the server to access 
                          // the session
      xfbml      : true,  // parse social plugins on this page
      version    : 'v2.2' // use version 2.2
    });

    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
      });
  };

  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
    }
    (document, 'script', 'facebook-jssdk')
  );

  window.fbAsyncInit = function() {
    FB.init({  
      appId      : '1643888345868772',
      xfbml      : true,
      version    : 'v2.4'
    });
  };

  (function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk')
  );

// Remove garbage from URL that appears after successful FB login
  if (window.location.hash == '#_=_') {
      window.location.hash = ''; // for older browsers, leaves a # behind
      history.pushState('', document.title, window.location.pathname); // nice and clean
      e.preventDefault(); // no page reload
  }



// YouTube player
  var tag = document.createElement('script');

  tag.src = "https://www.youtube.com/iframe_api";
  var firstScriptTag = document.getElementsByTagName('script')[0];
  firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

  var player;
  function onYouTubeIframeAPIReady() {
    player = new YT.Player('player', {
      height: '390',
      width: '640',
      videoId: 'EgdOjyYjjEc',
      events: {

        }
      });
    }

