class AddForeignKeyToIngredients < ActiveRecord::Migration
  def change
    add_foreign_key :ingredients, :projects
  end
end
