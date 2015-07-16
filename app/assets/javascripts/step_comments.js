// Jquery to filter for step comments on click
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

	$("#steps-table a").on("click", function(){
		console.log($(this).data("step-id"));
		console.log($(this).data("project-id"));
		console.log($(this).data("n-comments"));
		console.log($(this).data("comments"));
		
		$(".load-comments").replaceWith(

		)


	})
})