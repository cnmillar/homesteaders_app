
$(function($){

//ADD TO PREVENT # FROM SHOWING IN URL
  // $("a.noclick").on("click", function(e) {
  //   e.preventDefault;
  // })

  // $('.zoom-gallery').magnificPopup({
  //   delegate: 'a',
  //   type: 'image',
  //   closeOnContentClick: false,
  //   closeBtnInside: false,
  //   mainClass: 'mfp-with-zoom mfp-img-mobile',
  //   image: {
  //     verticalFit: true,
  //     titleSrc: function(item) {
  //      var caption = item.el.attr('title');

  //                       var pinItURL = "http://pinterest.com/pin/create/button/";

  //                       // Refer to http://developers.pinterest.com/pin_it/
  //                       pinItURL += '?url=' + 'http://dimsemenov.com/plugins/magnific-popup/';
  //                       pinItURL += '&media=' + item.el.attr('href');
  //                       pinItURL += '&description=' + caption;


  //                       return caption + ' &middot; <a class="pin-it" href="'+pinItURL+'" target="_blank"><img src="http://assets.pinterest.com/images/pidgets/pin_it_button.png" /></a>';
  //     }
  //   },
  //   gallery: {
  //     enabled: true,
  //     navigateByImgClick: true
  //   },
  //   zoom: {
  //     enabled: true,
  //     duration: 300, // don't foget to change the duration also in CSS
  //     opener: function(element) {
  //       return element.find('img');
  //     }
  //   }
    
  // });
/////////////

// Initializes and opens PhotoSwipe

$("#gallery").on("click", function(){
  var pswpElement = document.querySelectorAll('.pswp')[0];

  var images = $(this).data("images"); 
  var items1 = []; 
  for (var i=0; i < Object.keys(images).length; i++) {
    items1.push({
      src: images[i].url,
      description: images[i].description,
      user: images[i].user,
      created_at: images[i].created_at,
      w: 1200,
      h: 900
    })
  }
  // build items array
  var items = [
      {
          src: 'http://images.medicaldaily.com/sites/medicaldaily.com/files/2013/08/04/0/62/6259.jpg',
          w: 600,
          h: 400
      },
      {
          src: 'http://www.vvcofhamburg.com/wp-content/uploads/2015/07/little_cute_cat_1920x1080.jpg',
          w: 1200,
          h: 900
      }
  ];

  // define options (if needed)
  var options = {
      // optionName: 'option value'
      // for example:
      index: 0 // start at first slide
  };
  var gallery = new PhotoSwipe( pswpElement, PhotoSwipeUI_Default, items, options);
  gallery.init();
})

  $(".royalSlider").royalSlider({
      // options go here
      // as an example, enable keyboard arrows nav
      keyboardNavEnabled: true
  }); 


////////////

  var s = $("#comments");
  var pos = s.position();                    
  $(window).scroll(function() {
      var windowpos = $(window).scrollTop();
      if (windowpos >= pos.top) {
          s.addClass("stick");
      } else {
          s.removeClass("stick"); 
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
    player = new YT.Player('player', {
      height: '480',
      width: '720',
      videoId: 'EgdOjyYjjEc',
      events: {

        }
      });
    }




