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
})