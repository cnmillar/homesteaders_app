class PagesController < ApplicationController	

	def home
		@categories = Category.all.order('name asc')  
    @popular = Category.find(2,6,8)
  end

	def about

	end

end
