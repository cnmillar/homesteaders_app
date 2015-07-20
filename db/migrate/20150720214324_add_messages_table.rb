class AddMessagesTable < ActiveRecord::Migration
  def change
  	create_table :messages do |t|
  		t.belongs_to :user, index: true
  		t.text :body
  		t.string :subject
  		t.boolean :read
  		t.timestamps
  	end
  end
end
