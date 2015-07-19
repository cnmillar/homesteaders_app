class RemoveColumnAddUserIdToCommentsTable < ActiveRecord::Migration
  def change

  	remove_column :comments, :project_id, :integer
  	add_column :comments, :user_id, :integer

  end
end
