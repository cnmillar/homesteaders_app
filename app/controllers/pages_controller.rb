class PagesController < ApplicationController	

	def home
		@categories = Category.all.order('name asc')
  end

	def about

	end

end
