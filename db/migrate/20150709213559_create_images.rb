class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.belongs_to :user, index: true
      t.belongs_to :project, index: true
    	t.string :original
    	t.string :description
      t.timestamps
    end
  end
end
