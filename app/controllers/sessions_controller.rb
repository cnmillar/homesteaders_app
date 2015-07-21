class SessionsController < ApplicationController


  def new
  end

  def create
    user = User.find_by(facebook_id: auth_hash[:uid])

    uid = auth_hash[:uid]
    access_token = auth_hash[:credentials][:token] 
    app_secret = '91a1fc735691bdddba3a2fdd27c68ca4'
    obj = JSON.parse(open("https://graph.facebook.com/#{uid}?fields=email&access_token=#{access_token}").read)

    if !user

      full_name = auth_hash[:info][:name]
      facebook_id =  auth_hash[:uid]
      avatar_url = auth_hash[:info][:image]
      email =  obj["email"]
      
      user = User.new(facebook_id: facebook_id, full_name: full_name, email: email)
      user.remote_avatar_url = avatar_url
      user.save!

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


