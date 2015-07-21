class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    respond_to do |format|
      if @message && @message.save
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
