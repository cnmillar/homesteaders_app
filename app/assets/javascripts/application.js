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
//= require turbolinks
//= require social-share-button
//= require jquery.raty
//= require ratyrate
//= require_tree .

if (window.location.hash == '#_=_') {
    window.location.hash = ''; // for older browsers, leaves a # behind
    history.pushState('', document.title, window.location.pathname); // nice and clean
    e.preventDefault(); // no page reload
}

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
      var newAvatar = $('<div />').addClass('user-avatar').css({'left': timelineX, 'top' : 0 });
      $('#user-timeline').append(newAvatar);
    });

// Start of hover state for placed markers
    $('.user-avatar').hover(function(){
      clickedAvatar = $(this)
      var avatarFlyout = $('<div />').addClass('user-avatar-flyout').text('This is a comment.');
      clickedAvatar.append(avatarFlyout);
      });

