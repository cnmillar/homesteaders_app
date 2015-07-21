class ConversationsController < ApplicationController

	def create
		@conversation = Conversation.new
		@conversation.user_id = conversation_params[:user_id]
		@conversation.receiver = conversation_params[:receiver]
		@conversation.subject = conversation_params[:subject]

		respond_to do |format|

      if @conversation && @conversation.save
      	binding.pry
      	@message = Message.new
      	@message.body = conversation_params[:message].body
      	@message.conservation_id = @conversation.id
      	@message.user_id = conversation_params[:user_id]

      	if @message && @message.save
	        format.json{render json: @message}
      	else
	        format.json{render json: {error_message: "Unable to send message"}}
	      end

      else
        format.json{render json: {error_message: "Unable to send message"}}
      end
    end
	end

	private

	def conversation_params
    params.require(:conversation).permit(:subject, :body, :user_id, :receiver, :message)
	end

end