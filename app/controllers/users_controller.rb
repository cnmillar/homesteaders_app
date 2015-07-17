class UsersController < ApplicationController


  def update
    current_user.update_attributes(user_params)
    redirect_to :back
  end



	def show
    @current_user = current_user
    @user =  User.find(params[:id])
    @user_projects =  UserProject.where(user_id: @user.id)
    @images=[]
    @comments = Comment.where(user_id: @user.id)
	end

  def callback
    puts request.env['omniauth.auth'].inspect
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
