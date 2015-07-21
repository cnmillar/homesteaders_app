class ConversationsController < ApplicationController

	def create
		@conversation = Conversation.new
		@conversation.user_id = conversation_params[:user_id]
		@conversation.receiver = conversation_params[:receiver]
		@conversation.subject = conversation_params[:subject]
		@conversation.new_message = @conversation.receiver

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

	def update_new_message
		Conversation.find(params[:id]).update_attributes(new_message: nil)
		render json: nil, status: :ok
	end

	private

	def conversation_params
    params.require(:conversation).permit(:subject, :body, :user_id, :receiver, :conversation)
	end

end