class UserProjectsController < ApplicationController

  def show
    current_user.projects
  end

  def favourited
    @user_project = UserProject.find(params[:user_project_id])
    @user_project.update_attributes(favourited: !@user_project.favourited)    
    # redirect_to user_path(current_user)
    render 'users/show'
  end

    def completed
    @user_project = UserProject.find(params[:user_project_id])
    @user_project.update_attributes(completed: !@user_project.completed)
    # redirect_to user_path(current_user)
    render 'users/show'
  end
end
