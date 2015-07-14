class SessionsController < ApplicationController

  def new
  end

  def create

    user = User.where(facebook_id: auth_hash[:uid]).limit(1)
  
    if !user 

      first_name = auth_hash[:info][:name].split(' ').first
      last_name = auth_hash[:info][:name].split(' ').last 
      facebook_id =  auth_hash[:uid]
      avatar = auth_hash[:info][:image]

      user = User.create(facebook_id: facebook_id, first_name: first_name, last_name: last_name, avatar: avatar)
  
    end
  
    session[:user_id] = user.first.id
    redirect_to '/' 

  end



  def auth_hash
    request.env['omniauth.auth']
  end
    


  def destroy 
    session[:user_id] = nil 
    redirect_to '/' 
  end
end


