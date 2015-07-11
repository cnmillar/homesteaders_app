class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.belongs_to :project, index: true
    	t.integer :ordinal
    	t.text :content
      t.timestamps
    end
  end
end
