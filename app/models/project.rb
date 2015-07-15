class Project < ActiveRecord::Base

  scope :search, -> (title) { where("title like ?", "%" + title + "%") }

	has_many :ingredients
	has_many :steps
	has_many :images
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

	def get_all_comments
		all_comments = []

		project_comments = self.comments

		project_comments.each do |com|
			all_comments << com
		end

		self.ingredients.each do |ing|
			ing.comments.each do |com|
				all_comments << com
			end
		end

		self.steps.each do |step|
			step.comments.each do |com|
				all_comments << com
			end
		end

		self.video.comments.each do |com|
			all_comments << com
		end

		return all_comments

	end

end
