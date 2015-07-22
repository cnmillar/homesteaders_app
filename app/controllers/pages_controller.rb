class PagesController < ApplicationController	

	def home
		@categories = Category.all.order('name asc')  
    @popular = Category.find(2,8,16)
  end

	def about

	end

end
