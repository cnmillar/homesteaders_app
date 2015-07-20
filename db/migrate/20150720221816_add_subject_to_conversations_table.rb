class AddSubjectToConversationsTable < ActiveRecord::Migration
  def change
  	add_column :conversations, :subject, :string
  	remove_column :messages, :subject, :string
  end
end
