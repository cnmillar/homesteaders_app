class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.belongs_to :project, index: true
      t.string :url
      t.string :title
      t.string :duration

      t.timestamps
    end
  end
end
