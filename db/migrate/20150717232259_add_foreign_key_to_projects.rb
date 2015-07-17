class AddForeignKeyToProjects < ActiveRecord::Migration
  def change
    add_foreign_key :projects, :categories
  end
end
