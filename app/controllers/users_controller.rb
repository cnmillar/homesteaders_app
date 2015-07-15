class UsersController < ApplicationController

  def new

  end

  def create 

  end

	def show
    @current_user = current_user
    @user =  User.find(params[:id])
	end

  def callback
    puts request.env['omniauth.auth'].inspect
    redirect_to '/'
  end

end
