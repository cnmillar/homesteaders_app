class AddVideoTable < ActiveRecord::Migration
  def change
  	remove_column :projects, :video, :string
  	add_column :comments, :project_id, :integer
  end
end
