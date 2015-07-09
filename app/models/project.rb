class Project < ActiveRecord::Base

	has_many :ingredients
	has_many :steps
	has_many :images
	has_many :users, through: :userprojects
	has_many :comments, as: :commentable
	
	belongs_to :category

end
