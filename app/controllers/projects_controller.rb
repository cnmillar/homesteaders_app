class ProjectsController < ApplicationController

	def index
    title = params[:title]
      if title
        @projects = Project.search(title)
      else
		    @projects = Project.all
      end
	end

	def show
    @current_user = current_user
		@project = Project.find(params[:id])
    
    user_projects = @project.user_projects
    @fav_count = 0
    @comp_count = 0
    user_projects.each do |user|
      if user.favourited
        @fav_count += 1
      elsif user.completed
        @comp_count += 1
      end
    end

		@equipment = @project.ingredients.where(ing_type: "equipment")
		@ingredients = @project.ingredients.where(ing_type: "ingredient")

    @all_comments = @project.get_all_comments.sort_by(&:created_at).reverse.paginate(:page => params[:page])
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
