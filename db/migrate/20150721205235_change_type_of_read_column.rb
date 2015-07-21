class ChangeTypeOfReadColumn < ActiveRecord::Migration
  def change
  	remove_column :conversations, :read, :boolean
  	add_column :conversations, :new_message, :integer
  end
end
