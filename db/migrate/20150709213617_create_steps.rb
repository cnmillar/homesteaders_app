class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
    	t.integer :ordinal
    	t.text :content
      t.timestamps
    end
  end
end
