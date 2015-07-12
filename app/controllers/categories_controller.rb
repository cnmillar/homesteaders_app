class CategoriesController < ApplicationController

	def index
    @categories = Category.order('name asc').all
  end

  def show
    @category = Category.find(params[:id])
  end


end
