class User < ActiveRecord::Base
  has_secure_password 

	has_many :comments
	has_many :images
	has_many :projects, through: :user_projects

	ratyrate_rater

end
