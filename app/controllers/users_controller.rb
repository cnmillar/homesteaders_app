class UsersController < ApplicationController

  def new

  end

  def create 

  end

	def show

	end

  def callback
    puts request.env['omniauth.auth'].inspect

    redirect_to '/'
  end

end
