class ImagesController < ApplicationController

	def create
		@image = Image.new(image_params)
		# respond_to do |format|
	    if @image && @image.save
	    	# format.json{render json: @image}
	      redirect_to "/projects/#{@image.project_id}/", notice: "The image has been added to the project gallery."
	    else
				# format.json{render json: {error_message: "Unable to add comment"}}
	      redirect_to "/projects/#{@image.project_id}/", notice: "There was a problem."
	    end
	  # end
	end

	private

	def image_params
		params.require(:image).permit(:description, :original, :project_id, :user_id)
	end

end
