class AddReadToConversationsTableInsteadOfMessages < ActiveRecord::Migration
  def change
  	add_column :conversations, :read, :boolean
  	remove_column :messages, :read, :boolean
  end
end
