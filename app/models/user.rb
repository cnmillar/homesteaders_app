class User < ActiveRecord::Base

	has_many :comments
	has_many :images
	has_many :projects, through: :userprojects

end
