
$(function()
{
	function createComment(data){
		var comment = $("<div>");
		var userImage = $("<img>").attr("src", APP.userAvatar).css("width", "10%");
		comment.append(userImage).append(APP.userName).append(" " + data.content).append(" " + data.created_at).append(" (" + data.commentable_type + ")").append("<hr>");
		return comment;
	}

	$("#new_comment").on("ajax:success", function(e, data, status, xhr){
		$(".load-comments").prepend(createComment(data));
		$("#comment-content").val("");
	});

	$(".comments").on("click", ".load-comments .pagination a", function(e)
	{
  	e.preventDefault();
  	e.stopPropagation();
    $.getScript(this.href);
    return false;
  });
})