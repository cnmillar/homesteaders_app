class Project < ActiveRecord::Base

  scope :search, -> (title) { where("title like ?", "%" + title + "%") }

	has_many :ingredients
	has_many :steps
	has_many :galleries
	has_many :users, through: :user_projects
	has_many :user_projects
	has_many :comments, as: :commentable
  has_one :video
	
	belongs_to :category

	ratyrate_rateable 'overall'

	def youtube_url
    youtube_id = self.video.split("=").last
    "//www.youtube.com/embed/#{youtube_id}"
  end

end
