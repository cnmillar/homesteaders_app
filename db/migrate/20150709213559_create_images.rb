class CreateImages < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
    	t.string :original_image
    	t.string :resized_image
    	t.string :description
      t.timestamps
    end
  end
end
