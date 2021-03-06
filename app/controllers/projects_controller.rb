class ProjectsController < ApplicationController

	def index
    params[:title] ? @projects = Project.search(params[:title]) : @projects = Project.all
	end

	def show
    @current_user = current_user
		@project = Project.find(params[:id])
    @fav_count = 0
    @comp_count = 0
    
    user_projects = @project.user_projects

    user_projects.each do |user|
      @fav_count += 1 if user.favourited
      @comp_count += 1 if user.completed
    end
    
    if current_user
      @user_project = current_user.user_projects.where(project_id: @project.id)[0]
    end

		@equipment = @project.ingredients.where(ing_type: "equipment")
		@ingredients = @project.ingredients.where(ing_type: "ingredient")

    @all_comments = @project.get_all_comments.sort_by(&:created_at).reverse
    @video_comments = @project.video.comments
	end

  def send_project_mail
    @project = Project.find(params[:id])
    @user = current_user

    if current_user && current_user.email
      @user_email = current_user.email
      UserMailer.send_project_email(@project, @user).deliver
      flash[:notice] = "Project sent."
      redirect_to project_path(@project.id)
    else
      flash[:notice] = "We can't find an email for you!"
      redirect_to project_path(@project.id)
    end
  end

  protected


  def projects_params
    params.require(:project).permit(
      :title
    )
  end

end
