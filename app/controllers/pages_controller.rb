class PagesController < ApplicationController	

	def home
		@categories = Category.order('name asc').all
    @current_user = current_user
	end

end
