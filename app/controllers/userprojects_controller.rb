class UserProjectsController < ApplicationController

  def show
    @current_user = current_user
    @user_projects =  UserProject.where(user_id: @current_user.id)
  end

end
