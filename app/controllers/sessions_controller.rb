class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.where(facebook_id: auth_hash[:uid]).first
    # change to: 
    # user = User.find_by(facebook_id: auth_hash[:uid]).first

    if !user

      full_name = auth_hash[:info][:name]
      facebook_id =  auth_hash[:uid]
      avatar = auth_hash[:info][:image]
      email = auth_hash[:info][:email]

      user = User.create(facebook_id: facebook_id, full_name: full_name, avatar: avatar, email: email)
  
    end
    session[:user_id] = user.id
    @current_user = current_user
    redirect_to '/' 

  end

  def auth_hash
    request.env['omniauth.auth']
  end

  def destroy
    session.clear 
    redirect_to '/' 
  end
end


