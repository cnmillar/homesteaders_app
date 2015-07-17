class CategoriesController < ApplicationController
  
	def index
    @categories = Category.all.order('name asc')
  end

  def show
    @current_user = current_user # remove 
    @category = Category.find(params[:id])
  end

end
