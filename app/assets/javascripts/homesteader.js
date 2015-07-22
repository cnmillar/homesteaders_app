
$(function($){

  // tooltip

  $("#favourited-by-user").tooltip();
  $("#cant-favourite").tooltip();
  $("#total-comments").tooltip();
  $("#cant-comment").tooltip();
  $("#completed-by-user").tooltip();
  $("#cant-complete").tooltip();

  // modal js

  $('a[rel*=conversationModal]').leanModal({ top : 200, overlay : 0.4, closeButton: ".modal_close" });

  $("#new_conversation").on("ajax:success", function(e, data, status, xhr){
    $("#modal-container-conv").prepend("<h3 id='message-sent'>Message sent!</h3>");
    setTimeout(function() {
      $("#new-conversation").css("display","none");
      $("#lean_overlay").css("display","none");
      $("#conversation_subject").val("");
      $("#conversation_message_body").val("");
      $("#message-sent").remove();    
    }, 2000);

  })

// focus

  $("#total-comments").on("click", function(){
    $("#add-comment-general").slideToggle('slow', function(){});
    $("#comment-content").focus();
  })

//// toggle jquery
  $("#favourited-by-user").on("click", function(){
    if ($("#favourited-false").length > 0){
      $("#favourited-false").css("background", "url('/svg/heart213_hover.png')").css("background-size", "32px, 32px").attr("id","favourited-true");
      $("#favourite-count").html(parseInt($("#favourite-count").html())+1);
    } else{
      $("#favourited-true").css("background", "url('/svg/heart213.png')").css("background-size", "32px, 32px").attr("id","favourited-false");
      $("#favourite-count").html(parseInt($("#favourite-count").html())-1);      
    }
  })

  $("#completed-by-user").on("click", function(){
    if($("#completed-false").length > 0){
      $("#completed-false").css("background", "url('/svg/checkmark_hover.png')").css("background-size", "30px, 30px").attr("id", "completed-true");
      $("#complete-count").html(parseInt($("#complete-count").html())+1);
    } else {
      $("#completed-true").css("background", "url('/svg/checkmark4.png')").css("background-size", "32px, 32px").attr("id", 'completed-false');
      $("#complete-count").html(parseInt($("#complete-count").html())-1);
    }

  })

////User-projects toggle jquery

 $(".favourited, .not-favourited").bind('ajax:complete', function() {
  var favourited = ($(this).attr("class") === 'favourited' ? true : false)
  if (favourited) {
    $(this).find("img").remove();
    $(this).removeClass('favourited');
    $(this).append("<img src='/svg/heart213.svg'>");
  } else {
    $(this).find("img").remove();
    $(this).addClass('favourited');
    $(this).append("<img src='/svg/heart213_hover.png'>");

  }
   
});

  $(".completed, .not-completed").bind('ajax:complete', function() {
  var completed = ($(this).attr("class") === 'completed' ? true : false)
  if (completed) {
    $(this).find("img").remove();
    $(this).removeClass('completed');
    $(this).append("<img src='/svg/delete38.svg'>");
  } else {
    $(this).find("img").remove();
    $(this).addClass('completed');
    $(this).append("<img src='/svg/checkmark4.png'>");

  }
   
});


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
        pauseOnHover: true,
        transitionSpeed: 1000
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
      // origin: 'https://localhost:3000',
      videoId: videoId,
      events: {

        }
      });
    }


// Comments

$(function()
{
/////////////////////////////////////
// Comment pagination

  var paginate = function(content){
    $(".pagination").paging(content.length, { 
      format: '[ <>]', // define how the navigation should look like and in which order onFormat() get's called
      perpage: 5, // show 5 elements per page
      lapping: 0, // don't overlap pages for the moment
      page: 1, // start at page, can also be "null" or negative
      onSelect: function (page) {
        var data = this.slice;
        content.slice(prev[0], prev[1]).css('display', 'none');
        content.slice(data[0], data[1]).fadeIn("slow");
        prev = data;
        return true; // locate!
        },
      onFormat: function (type) {
        switch (type) {
        case 'block': // n and c
            return '<a href="javascript:null;">' + this.value + '</a>';
        case 'next': // >
            return '        <a href="javascript:null;"><img src="/svg/fast40.svg" width="35px"></a>';
        case 'prev': // <
            return '    <a href="javascript:null;"><img src="/svg/rewind42.svg" width="35px"></a>';
        case 'first': // [
            return '    <a href="javascript:null;"><img src="/svg/first46.svg" width="40px"></a>';
        case 'last': // ]
            return '    <a href="javascript:null;"><img src="/svg/last17.svg" width="40px"> (' + this.pages + ')</a>';
        }
      }
    });
  }

  var prev = {start: 0, stop: 0},
      content = $('.load-comments div.element');

// On page load, call paginate function to paginate all comments
  $('.pagination').html('<div/>');
  paginate(content);

// Step comments filter
  $(".steps-ul .filter-step-comments").on("click", function(){
    var prev = {start: 0, stop: 0}

    if (!$(".load-comments").data("click")) {
      var content = $('.load-comments div.element.Step.' + $(this).data("step-id"));
      $(".load-comments").data("click", true);
      $('#view-all-comments').css("display","inline");
    } else {
      var content = $('.load-comments div.element');
      $(".load-comments").data("click", false);
      $('#view-all-comments').css("display","none");
    }

    $('.load-comments div.element').css("display", "none");
    paginate(content);
    if (content.length === 0){
      $("#no-comments").css("display","inline");
    } else {
      $("#no-comments").css("display","none");
    }
  });

// Ingredient comments filter
  $(".ing-ul .filter-ing-comments").on("click", function(){
    var prev = {start: 0, stop: 0}

    if (!$(".load-comments").data("click")) {
      var content = $('.load-comments div.element.Ingredient.' + $(this).data("ing-id"));
      $(".load-comments").data("click", true);
      $('#view-all-comments').css("display","inline");
    } else {
      var content = $('.load-comments div.element');
      $(".load-comments").data("click", false);
      $('#view-all-comments').css("display","none");
    }
    $('.load-comments div.element').css("display", "none");
    paginate(content);
    if (content.length === 0){
      $("#no-comments").css("display","inline");
    } else {
      $("#no-comments").css("display","none");
    }
  });

// Equipment comments filter
  $(".equip-ul .filter-equip-comments").on("click", function(){
    var prev = {start: 0, stop: 0}

    if (!$(".load-comments").data("click")){
      var content = $('.load-comments div.element.Ingredient.' + $(this).data("equip-id"));
      $('#view-all-comments').css("display","inline");
      $(".load-comments").data("click", true);
    } else {
      var content = $('.load-comments div.element');
      $('#view-all-comments').css("display","none");
      $(".load-comments").data("click", false);
    }

    $('.load-comments div.element').css("display", "none");
    paginate(content);
    if (content.length === 0){
      $("#no-comments").css("display","inline");
    } else {
      $("#no-comments").css("display","none");
    }
  });

// When displaying filtered comments, let user click "View all comments" to return to all comments
  $("#view-all-comments").on("click", function(){
    var prev = {start: 0, stop: 0},
      content = $('.load-comments div.element');
    $('.load-comments div.element').css("display", "none");
    paginate(content);
    $('#view-all-comments').css("display","none");
    $("#no-comments").css("display","none");

  });

/////////////////////////////
// Jquery to add comment to page on form submission without page reload

  function createComment(data){
    // Add avatar to timeline if video comment
    if (data.commentable_type == "Video") {
    
      // This first part duplicates stuff below so could be made DRYer    
      totalTime = player.getDuration();
      percentComplete = data.video_time/totalTime;

      //Subtract 10 so that the avatar is centered on the timestamp.
      timelineX = percentComplete*720 - 10;

      //If timelineX is now less than 0, reset to 0
      if (timelineX < 0) {
      timelineX = 0
      } 
      
      newAvatar = $('<div />').addClass('video-comment-avatar').html("'<img src = ' + APP.userName />").css({'left': timelineX, 'top' : 0 });
      $('#video-timeline').append(newAvatar);
    }

    return '<div class="element ' + data.commentable_type + " " + data.commentable_id + '">'+
        '<a href="/users/' + data.user_id + '"><img alt="Picture" src="' + APP.userAvatar + '" width="10%"></a>'+ " " + 
        APP.userName +  " " +       
        data.content + " " + 
        data.created_at +  
        '<small>('+ data.commentable_type +')</small> ' + 
        '<hr>' + 
      '</div>'
  }

  $(".new_comment").on("ajax:success", function(e, data, status, xhr){
    $(this).find("#comment-content").val("");
    var prev = {start: 0, stop: 0}
    $(".load-comments").prepend(createComment(data));
    var content = $('.load-comments div.element');
    $('.load-comments div.element').css("display", "none");
    paginate(content);
    $('#view-all-comments').css("display","none");
    if (content.length === 0){
      $("#no-comments").css("display","inline");
    }
    $("#add-comment-general").slideToggle('slow', function(){});

  }); 

///////////////////////////
// add comment form with toggle slide

  $(".add-comment-ing").on("click", function(){
    $("#add-comment-ing"+$(this).data("ing-id")).slideToggle('slow', function(){
    })
  })
  $(".add-comment-equip").on("click", function(){
    $("#add-comment-equip"+$(this).data("equip-id")).slideToggle('slow', function(){
    })
  })
  $(".add-comment-step").on("click", function(){
    $("#add-comment-step"+$(this).data("step-id")).slideToggle('slow', function(){
    })
  })

  $(".add-comment-general").on("click", function(){
    var currentTime = player.getCurrentTime()
    $("#add-comment-general").slideToggle('slow', function(){})
    $('#video-time-field').replaceWith('<input id="comment_video_time" type="hidden" name="comment[video_time]" value=' + currentTime + '" />');
    var hours = parseInt( currentTime / 3600 ) % 24;
    var minutes = parseInt( currentTime / 60 ) % 60;
    var seconds = Math.round(currentTime % 60);
    if (currentTime > 0) {
      if (hours > 0) {
        displayTime = (hours < 10 ? "0" + hours : hours) + ":" + (minutes < 10 ? "0" + minutes : minutes) + ":" + (seconds  < 10 ? "0" + seconds : seconds) 
      }
      else {
        displayTime = (minutes < 10 ? "0" + minutes : minutes) + ":" + (seconds  < 10 ? "0" + seconds : seconds)
      }
      $('.commentable-type-checkbox-project').addClass('commentable-type-checkbox-video');
      $('#video-time-text').replaceWith('<p>Attach this comment to: ' + displayTime + '.</p>')
    }
  })

  $(".add-image").on("click", function(){
    $("#add-image").slideToggle('slow', function(){})
  })


///////////////////////////
// add comment and display information without page reload

  $(".step-comment-id").on("ajax:success", function(e, data, status, xhr){
    $(".steps-comment-content").val("");
    var stepId = $(this).find('input').last().data("step-id");
    var oldCount = parseInt($(".step-count."+stepId).text());
    var newCount = oldCount + 1;
    $(".step-count." + stepId).text(newCount);

    var prev = {start: 0, stop: 0}
    $(".load-comments").prepend(createComment(data));
    var content = $('.load-comments div.element');
    $('.load-comments div.element').css("display", "none");
    paginate(content);
    $('#view-all-comments').css("display","none");
    if (content.length === 0){
      $("#no-comments").css("display","inline");
    }

    $("#add-comment-step"+$(this).find('input').last().data("step-id")).slideToggle('slow', function(){
    })
  }); 

  $(".equip-comment-id").on("ajax:success", function(e, data, status, xhr){
    $(".equip-comment-content").val("");
    var equipId = $(this).find('input').last().data("equip-id");
    var oldCount = parseInt($(".equip-count."+equipId).text());
    var newCount = oldCount + 1;
    $(".equip-count." + equipId).text(newCount);

    var prev = {start: 0, stop: 0}
    $(".load-comments").prepend(createComment(data));
    var content = $('.load-comments div.element');
    $('.load-comments div.element').css("display", "none");
    paginate(content);
    $('#view-all-comments').css("display","none");
    if (content.length === 0){
      $("#no-comments").css("display","inline");
    }

    $("#add-comment-equip"+$(this).find('input').last().data("equip-id")).slideToggle('slow', function(){
    })
  }); 

  $(".ing-comment-id").on("ajax:success", function(e, data, status, xhr){
    $(".ing-comment-content").val("");
    var ingId = $(this).find('input').last().data("ing-id");
    var oldCount = parseInt($(".ing-count."+ingId).text());
    var newCount = oldCount + 1;
    $(".ing-count." + ingId).text(newCount);

    var prev = {start: 0, stop: 0}
    $(".load-comments").prepend(createComment(data));
    var content = $('.load-comments div.element');
    $('.load-comments div.element').css("display", "none");
    paginate(content);
    $('#view-all-comments').css("display","none");
    if (content.length === 0){
      $("#no-comments").css("display","inline");
    }
    $("#add-comment-ing"+$(this).find('input').last().data("ing-id")).slideToggle('slow', function(){
    })
  }); 


})


