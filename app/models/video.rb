class Video < ActiveRecord::Base
  belongs_to :project
  has_many :comments, as: :commentable
end
