class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  helper_method :current_user, :num_new_messages

  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end

  def num_new_messages
    num_new_messages = Conversation.where(new_message: current_user.id).length
  end

  def require_user 
    redirect_to '/login' unless current_user 
  end

  def require_email
    redirect_to '/email' unless !current_user.email.empty? 
  end
end
