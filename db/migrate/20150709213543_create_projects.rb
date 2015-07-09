class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.string :title
    	t.string :description
    	t.string :video
    	t.integer :difficulty
    	t.integer :batch_size
    	t.string :batch_unit
    	t.float :avg_rating
    	t.ingeter :kit_id, default: 0
      t.timestamps
    end
  end
end
