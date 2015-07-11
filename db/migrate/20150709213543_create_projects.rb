class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.belongs_to :category, index: true
    	t.string :title
    	t.text :description
    	t.string :video
    	t.integer :difficulty
    	t.float :batch_size
    	t.string :batch_unit
    	t.float :avg_rating
    	t.integer :kit_id
      t.timestamps
    end
  end
end
