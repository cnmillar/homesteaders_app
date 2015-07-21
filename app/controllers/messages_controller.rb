class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    respond_to do |format|
      if @message && @message.save
        @conversation = Conversation.find(@message.conversation_id)
        binding.pry
        if @message.user_id == @conversation.user_id
          @conversation.update_attributes(new_message: @conversation.receiver)
        else
          @conversation.update_attributes(new_message: @conversation.user_id)
        end

        format.json{render json: @message}
      else
        format.json{render json: {error_message: "Unable to send reply"}}
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id, :conversation_id)
  end
end
