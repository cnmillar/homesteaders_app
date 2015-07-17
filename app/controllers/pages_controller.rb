class PagesController < ApplicationController	

	def home
		@categories = Category.all.order('name asc')
    @current_user = current_user # remove
	end

end
