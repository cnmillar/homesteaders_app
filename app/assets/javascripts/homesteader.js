
$(function($){
  $('a[rel*=conversationModal]').leanModal({ top : 200, overlay : 0.4, closeButton: ".modal_close" });

  $("#new_conversation").on("ajax:success", function(e, data, status, xhr){
    $("#new-conversation").css("display","none");
    $("#lean_overlay").css("display","none");
    $("#conversation_subject").val("");
    $("#conversation_message_body").val("");
  })

// focus

  $("#total-comments").on("click", function(){
    $("#add-comment-general").slideToggle('slow', function(){});
    $("#comment-content").focus();
  })

//// toggle jquery
  $("#favourited-by-user").on("click", function(){
    if ($("#favourited-false").length > 0){
      $("#favourited-false").css("background", "url('/svg/heart213_hover.png')").css("background-size", "40px, 40px").attr("id","favourited-true");
      $("#favourite-count").html(parseInt($("#favourite-count").html())+1);
    } else{
      $("#favourited-true").css("background", "url('/svg/heart213.png')").css("background-size", "40px, 40px").attr("id","favourited-false");
      $("#favourite-count").html(parseInt($("#favourite-count").html())-1);      
    }
  })

  $("#completed-by-user").on("click", function(){
    if($("#completed-false").length > 0){
      $("#completed-false").css("background", "url('/svg/checkmark_hover.png')").css("background-size", "40px, 40px").attr("id", "completed-true");
      $("#complete-count").html(parseInt($("#complete-count").html())+1);
    } else {
      $("#completed-true").css("background", "url('/svg/checkmark4.png')").css("background-size", "40px, 40px").attr("id", 'completed-false');
      $("#complete-count").html(parseInt($("#complete-count").html())-1);
    }

  })

/////////////
// Gallery JS

  $(".royalSlider").royalSlider({
      // options go here
      // as an example, enable keyboard arrows nav
      globalCaption: true,
      keyboardNavEnabled: true,
      autoScaleSlider: true,
      fullscreen: {
        // fullscreen options go gere
        enabled: true,
        nativeFS: false
      },

      // deeplinking: {
      //   // deep linking options go gere
      //   enabled: true,
      //   prefix: 'slider-'
      // },

      autoPlay: {
        // autoplay options go gere
        enabled: true,
        pauseOnHover: true
      }
  }); 

    var win = $(window),
        w,
        currRs;

    $('.openBoxButton').magnificPopup({
      type: 'ajax',
      callbacks: {
        close: function() {
          // destroy the slider to avoid memory leaks
          if(this.content) {
            this.content.find('.royalSlider').data('royalSlider').destroy();
          }
          
        }
      }
    });

    $('.sliderInLightbox').royalSlider({
      imageScaleMode: 'fill',
      keyboardNavEnabled: true,
      video: {
        autoHideControlNav: true
      }
    });

////////////

  var s = $("#comments");
  var pos = s.position();                    
  $(window).scroll(function() {
      var windowpos = $(window).scrollTop();
      if (pos){
        if (windowpos >= pos.top) {
            s.addClass("stick");
        } else {
            s.removeClass("stick"); 
        }       
      }
  });

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
    timelineX = percentComplete*720 - 10;
    //If timelineX is now less than 0, reset to 0
    if (timelineX < 0) {
      timelineX = 0
    }
    var newAvatar = $('<div />').addClass('video-comment-avatar').html('<img src = "https://placekitten.com/g/32/32" />').css({'left': timelineX, 'top' : 0 });
    $('#video-timeline').append(newAvatar);
  });

// Hover state for comment markers
  $('.video-comment').on('mouseenter', function() {
    var comment_id = $(this).data('comment-id');
    var comment_user = $(this).data('comment-user-name');
    var comment_timestamp = $(this).data('comment-timestamp');
    var comment_content_el = $('#comment_id_' + comment_id);
    var comment_content = comment_content_el.text();
    $('#activeComment').remove();
    hoveredAvatar = $(this);
    avatarFlyout = $('<div />', {
      id: 'activeComment',
      class: 'video-comment-flybelow',
      text: comment_user + " said: " + comment_content + " at " + comment_timestamp
    });
    setTimeout(function(){
      hoveredAvatar.append(avatarFlyout).fadeIn(1000);
    }, 200); 
  });

  $('.video-comment').on('mouseleave', function() {
    $("#activeComment").remove();
  });

// Shopify info
  $(function(){
    $("#submit-to-cart").on("click", function(){
      var items = $(".shopify_cart");
      var cart = "http://homesteaders-emporium.myshopify.com/cart/";

      for (var i=0; i < items.length; i++ ) {
        if ($(items[i]).is(":checked")) {
          cart = cart + $(items[i]).attr("data-shopifyid") + ":" + parseInt($(items[i]).attr("data-quantity")) + ",";
        }
      }
      window.open(cart);
    });

    $("#select-all").on("click", function(e){
      if(this.checked){
        $('.shopify_cart').each(function(){
          this.checked = true;
        })
      }
      else {
        $('.shopify_cart').each(function(){
          this.checked = false;
        })
      }
    })
  });
});

// Facebook login feature

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
    var videoId = $('#player').data('video-id');
    player = new YT.Player('player', {
      height: '480',
      width: '720',
      videoId: videoId,
      events: {

        }
      });
    }




