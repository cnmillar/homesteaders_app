class User < ActiveRecord::Base
  validates :facebook_id, uniqueness: true

	# has_many :comments, as: :commentable
	has_many :comments
	has_many :images
	has_many :projects, through: :user_projects
	has_many :user_projects

  # Use for read-only activities only ;)
  has_many :unique_projects, -> { distinct }, through: :user_projects, source: :project, class_name: 'Project'

	has_many :messages
	has_many :conversations


	ratyrate_rater

  #Do not delete
  # mount_uploader :avatar, AvatarUploader

end
