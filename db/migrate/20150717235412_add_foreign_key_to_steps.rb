class AddForeignKeyToSteps < ActiveRecord::Migration
  def change
    add_foreign_key :steps, :projects
  end
end
