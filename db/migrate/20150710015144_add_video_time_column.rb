class AddVideoTimeColumn < ActiveRecord::Migration
  def change
  	add_column :comments, :video_time, :integer
  end
end
