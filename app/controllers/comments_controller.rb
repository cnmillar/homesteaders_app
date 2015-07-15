class CommentsController < ApplicationController

	def create
		@comment = Comment.new(comment_params)

		if @comment && @comment.save
			redirect_to project_path(@comment.commentable_id), notice: "Successfully added comment."
		else
			redirect_to project_path(comment_params[:commentable_id]), notice: "Was not able to add comment."
		end

	end

	private

	def comment_params
		params.require(:comment).permit(:content, :commentable_type, :commentable_id, :user_id)
	end

end
