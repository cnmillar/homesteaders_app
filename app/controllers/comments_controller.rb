class CommentsController < ApplicationController

	def create
		@comment = current_user.comments.new(comment_params)
		# @comment = Comment.new(comment_params)
		# @comment.user = current_user
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
		params.require(:comment).permit(:content, :commentable_type, :commentable_id, :project_id)
	end

  def show
  end


end
