class User < ActiveRecord::Base
  validates :facebook_id, uniqueness: true

	has_many :comments
	has_many :images
	has_many :projects, through: :user_projects

end
