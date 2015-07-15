class UserProjectsController < ApplicationController

  def show
    @current_user = current_user
    @user_projects =  UserProject.where(user_id: @current_user.id)
  end

  def favourited
    @current_user = current_user
    @user_project = UserProject.find(params[:user_project_id])
    if @user_project.favourited == true
      @user_project.update_attributes(favourited: false)
    else
      @user_project.update_attributes(favourited: true)
    end
    
    redirect_to user_path(current_user)
  end

    def completed
    @current_user = current_user
    @user_project = UserProject.find(params[:user_project_id])
    if @user_project.completed == true
      @user_project.update_attributes(completed: false)
    else
      @user_project.update_attributes(completed: true)
    end
    
    redirect_to user_path(current_user)
  end

end
