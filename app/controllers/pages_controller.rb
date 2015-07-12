class PagesController < ApplicationController	

	def home
		@categories = Category.order('name asc').all
	end

end
