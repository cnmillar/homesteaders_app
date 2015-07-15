class CategoriesController < ApplicationController
  

	def index
    @categories = Category.order('name asc').all
  end

  def show
    @current_user = current_user
    @category = Category.find(params[:id])
  end


end
