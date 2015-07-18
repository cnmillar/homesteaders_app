class AddForeignKeyToUserProjects < ActiveRecord::Migration
  def change
    add_foreign_key :user_projects, :projects
    add_foreign_key :user_projects, :users
  end
end
