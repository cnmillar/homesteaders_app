class Image < ActiveRecord::Base

	belongs_to :user
	belongs_to :project
	has_many :comments, as: :commentable

	mount_uploader :original, ImageUploader

end