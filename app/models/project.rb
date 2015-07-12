class Project < ActiveRecord::Base

	has_many :ingredients
	has_many :steps
	has_many :images
	has_many :users, through: :user_projects
	has_many :comments, as: :commentable
  has_one :video
	
	belongs_to :category

	def youtube_url
    youtube_id = self.video.split("=").last
    # "<iframe src='//www.youtube.com/embed/#{youtube_id}'></iframe>"
    "//www.youtube.com/embed/#{youtube_id}"
  end

end
