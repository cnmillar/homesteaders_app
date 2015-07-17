// Jquery to add comment to page on form submission without page reload

$(function()
{
	function createComment(data){
	return '<div>'+
			'<a href="/users/' + data.user_id + '"><img alt="Picture" src="' + APP.userAvatar + '" width="10%"></a>'+	" " + 
			APP.userName +	" " +				
			data.content + " " + 
			data.created_at +	" " + 
			'<small>('+ data.commentable_type +')</small>	' +	
			'<hr>' + 
		'</div>'
	}

	$("#new_comment").on("ajax:success", function(e, data, status, xhr){
		$(".load-comments").prepend(createComment(data));
		$("#comment-content").val("");
	});	

/////////////////////////////////////
// Comment pagination

	var paginate = function(content){
		$(".pagination").paging(content.length, { // make 1337 elements navigatable
	    format: '[< ncnnn >]', // define how the navigation should look like and in which order onFormat() get's called
	    perpage: 2, // show 10 elements per page
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
	            return '<a href="javascript:null;">first</a>';
	        case 'last': // ]
	            return '<a href="javascript:null;">last</a>';
	        }
	    }
		});
	}

	var prev = {start: 0, stop: 0},
	    content = $('.load-comments div.element');

	$('.pagination').html('<div/>');
	paginate(content);

	$("#steps-table a").on("click", function(){
		var prev = {start: 0, stop: 0},
	    content = $('.load-comments div.element.Step.' + $(this).data("step-id"));
	  // $(".load-comments").html("");
	  $('.load-comments div.element').css("display", "none");
	  paginate(content);

	});

})
