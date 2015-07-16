
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

		// var comment = $("<div>");
		// var userImage = comment.append("<a href = /users/", $.parseJSON(xhr.responseText).user_id, "><img src = ", APP.userAvatar, ", width = '10%'></a>");
		// var userImage = $("<img>").attr("src", APP.userAvatar).css("width", "10%");
		// comment.append(userImage).append(APP.userName).append(" " + data.content).append(" " + data.created_at).append(" (" + data.commentable_type + ")").append("<hr>");
		// return comment;
	}

	$("#new_comment").on("ajax:success", function(e, data, status, xhr){
		$(".load-comments").prepend(createComment(data));
		$("#comment-content").val("");
	});

	
})