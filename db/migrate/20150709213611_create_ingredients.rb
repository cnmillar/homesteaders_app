class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
    	t.string :name
      t.string :type
    	t.integer :shopify_id
    	t.integer :unit_size
    	t.string :unit_measure
    	t.boolean :availability
      t.timestamps
    end
  end
end
