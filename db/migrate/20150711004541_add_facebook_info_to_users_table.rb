class AddFacebookInfoToUsersTable < ActiveRecord::Migration
  def change
  	add_column(:users, :first_name, :string)
  	add_column(:users, :last_name, :string)
  	add_column(:users, :facebook_id, :integer)
  	remove_column(:users, :username)
  	remove_column(:users, :password)
  end
end
