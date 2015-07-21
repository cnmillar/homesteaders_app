class UsersController < ApplicationController

  def update
    current_user.update_attributes(user_params)
    redirect_to :back
  end

	def show
    @user =  User.find(params[:id])
    @user_projects =  UserProject.where(user_id: @user.id)
    @images=[]
    @comments = @user.comments

    @conversation = Conversation.new
  	end

  def callback
    request.env['omniauth.auth']
    redirect_to '/'
  end

  def inbox
    @conversations = current_user.conversations
    @user = User.find(params[:id])
  end

  def reply
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

  def user_params
    params.require(:user).permit(:email)
  end

  def message_params
    params.require(:message).permit(:body, :user_id, :conversation_id, :receiver)
  end
end
