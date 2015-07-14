class User < ActiveRecord::Base
  validates :facebook_id, uniqueness: true

	has_many :comments
	has_many :images
	has_many :projects, through: :user_projects
	has_many :user_projects

	ratyrate_rater

end
