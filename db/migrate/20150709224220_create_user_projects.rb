class CreateUserProjects < ActiveRecord::Migration
  def change
    create_table :user_projects do |t|
    	t.belongs_to :users, index: true
    	t.belongs_to :projects, index: true
    	t.boolean :favourited
    	t.boolean :commented
    	t.integer :rating
      t.timestamps
    end
  end
end
