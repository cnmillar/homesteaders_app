class DropUsersTable < ActiveRecord::Migration
  def change
  	drop_table :users

  	create_table :users do |t|
		  t.integer :facebook_id
		  t.string :first_name
		  t.string :last_name
		  t.string :email
		  t.string :avatar
		  t.boolean :admin
		  t.timestamps
		end

  end
end
