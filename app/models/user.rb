class User < ActiveRecord::Base
  validates :facebook_id, uniqueness: true

	# has_many :comments, as: :commentable
	has_many :comments
	has_many :images
	has_many :projects, through: :user_projects
	has_many :user_projects
	has_many :messages
	has_many :conversations

	ratyrate_rater

end
