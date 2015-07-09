class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
    	t.integer :ordinal
    	t.string :content
      t.timestamps
    end
  end
end
