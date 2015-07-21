class ConversationsController < ApplicationController

	def create
		@conversation = Conversation.new
		@conversation.user_id = conversation_params[:user_id]
		@conversation.receiver = conversation_params[:receiver]
		@conversation.subject = conversation_params[:subject]
		@conversation.read = false

		respond_to do |format|

      if @conversation && @conversation.save
      	@message = Message.new
      	@message.body = params[:conversation][:message][:body]
      	@message.conversation_id = @conversation.id
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
    params.require(:conversation).permit(:subject, :body, :user_id, :receiver, :conversation)
	end

end