class UserProjectsController < ApplicationController

  def show
    @current_user = current_user # remove
    @user_projects =  UserProject.where(user_id: @current_user.id)
    # current_user.projects
  end

  def favourited
    @current_user = current_user #remove
    # CHANGE TO
    # @user_project.update_attributes(favourited: !@user_project.favourited)

    @user_project = UserProject.find(params[:user_project_id])
    if @user_project.favourited 
      @user_project.update_attributes(favourited: false)
    else
      @user_project.update_attributes(favourited: true)
    end
    
    redirect_to user_path(current_user)
  end

    def completed
    @current_user = current_user # REMOVE
    # CHANGE TO SOMETHING SIMILAR TO FAVOURITED
    
    @user_project = UserProject.find(params[:user_project_id])
    if @user_project.completed
      @user_project.update_attributes(completed: false)
    else
      @user_project.update_attributes(completed: true)
    end
    
    redirect_to user_path(current_user)
  end

end
