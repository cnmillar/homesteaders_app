class ProjectsController < ApplicationController

	def index
		@projects = Project.all
	end

	def show
    @project = Project.find(params[:id])
    @equipment = @project.ingredients.where(ing_type: "equipment")
    @ingredients = @project.ingredients.where(ing_type: "ingredient")
	end
	

end
