class CreateConversationTable < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
    	t.belongs_to :user, index: true
    	t.integer :receiver
    	t.timestamps
    end
  end
end
