class SessionsController < ApplicationController

  def new
  end

  def create
    # if user = User.where(facebook_id: auth_hash[:uid])

      # session[:user_id] = user.facebook_id


    # else 
      first_name = auth_hash[:info][:name].split(' ').first
      last_name = auth_hash[:info][:name].split(' ').last 
      facebook_id =  auth_hash[:uid]
      avatar = auth_hash[:info][:image]
      binding.pry

      User.create(facebook_id: facebook_id, first_name: first_name, last_name: last_name, avatar: avatar)
      session[:user_id] = user.facebook_id
      redirect_to '/' 
    # end
  end



  def auth_hash
    request.env['omniauth.auth']
  end
    


  def destroy 
    session[:user_id] = nil 
    redirect_to '/' 
  end
end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to movies_path, notice: "Welcome back, #{user.firstname}!"
    else
      flash.now[:alert] = "Log in failed..."
      render :new
    end
  end
