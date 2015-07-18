
$(function()
{
/////////////////////////////////////
// Comment pagination

	var paginate = function(content){
		$(".pagination").paging(content.length, { 
	    format: '[ <nncnn>]', // define how the navigation should look like and in which order onFormat() get's called
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
	            return '<a href="javascript:null;">&gt;</a>';
	        case 'prev': // <
	            return '<a href="javascript:null;">&lt;</a>';
	        case 'first': // [
	            return '<a href="javascript:null;">First</a>';
	        case 'last': // ]
	            return '<a href="javascript:null;">Last (' + this.pages + ')</a>';
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
	$("#steps-table .filter-step-comments").on("click", function(){
		var prev = {start: 0, stop: 0},
	    content = $('.load-comments div.element.Step.' + $(this).data("step-id"));
	  $('.load-comments div.element').css("display", "none");
	  paginate(content);
	  $('#view-all-comments').css("display","inline");
	  if (content.length === 0){
	  	$("#no-comments").css("display","inline");
	  }
	});

// Ingredient comments filter
	$(".ing-ul .filter-ing-comments").on("click", function(){
		var prev = {start: 0, stop: 0},
	    content = $('.load-comments div.element.Ingredient.' + $(this).data("ing-id"));
	  $('.load-comments div.element').css("display", "none");
	  paginate(content);
	  $('#view-all-comments').css("display","inline");
	  if (content.length === 0){
	  	$("#no-comments").css("display","inline");
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
	return '<div class="element ' + data.commentable_type + " " + data.commentable_id + '">'+
			'<a href="/users/' + data.user_id + '"><img alt="Picture" src="' + APP.userAvatar + '" width="10%"></a>'+	" " + 
			APP.userName +	" " +				
			data.content + " " + 
			data.created_at +	" " + 
			'<small>('+ data.commentable_type +')</small>	' +	
			'<hr>' + 
		'</div>'
	}

	$("#new_comment").on("ajax:success", function(e, data, status, xhr){
		$("#comment-content").val("");
		var prev = {start: 0, stop: 0}
		$(".load-comments").prepend(createComment(data));
    var content = $('.load-comments div.element');
	  $('.load-comments div.element').css("display", "none");
	  paginate(content);
	  $('#view-all-comments').css("display","none");
	  if (content.length === 0){
	  	$("#no-comments").css("display","inline");
	  }
	});	

///////////////////////////
// add comment with toggle slide

	$(".add-comment").on("click", function(){
		$("#add-comment-"+$(this).data("ing-id")).slideToggle('slow', function(){
		})
	})
	$(".add-comment").on("click", function(){
		$("#add-comment-"+$(this).data("equip-id")).slideToggle('slow', function(){
		})
	})

})


