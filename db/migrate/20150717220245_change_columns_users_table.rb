class ChangeColumnsUsersTable < ActiveRecord::Migration
  def change
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    add_column :users, :full_name, :string
  end
end
