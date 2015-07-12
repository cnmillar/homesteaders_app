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
		@project = Project.find(params[:id])
		@equipment = @project.ingredients.where(ing_type: "equipment")
		@ingredients = @project.ingredients.where(ing_type: "ingredient")
	end

  protected

  def projects_params
    params.require(:project).permit(
      :title
    )
  end

end
