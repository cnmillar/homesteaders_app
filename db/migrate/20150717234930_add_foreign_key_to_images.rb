class AddForeignKeyToImages < ActiveRecord::Migration
  def change
    add_foreign_key :images, :projects
    add_foreign_key :images, :users
  end
end
