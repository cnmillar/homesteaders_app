class CommentsController < ApplicationController

	def create
		@comment = Comment.new(comment_params)
		@comment.user = current_user
		respond_to do |format|
			if @comment && @comment.save
				format.json{render json: @comment}
			else
				format.json{render json: {error_message: "Unable to add comment"}}
			end
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:content, :user_id, :commentable_type, :commentable_id, :project_id, :video_time)
	end


end
