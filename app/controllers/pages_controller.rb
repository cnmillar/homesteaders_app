class PagesController < ApplicationController	

	def home
		@categories = Category.all.order('name asc')
	end

end
