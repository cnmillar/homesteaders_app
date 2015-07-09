class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.boolean :admin, default: false
    	t.string :username
    	t.string :email
    	t.string :password
    	t.string :avatar
      t.timestamps
    end
  end
end