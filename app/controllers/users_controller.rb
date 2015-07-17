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
	end

  def callback
    request.env['omniauth.auth']
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
