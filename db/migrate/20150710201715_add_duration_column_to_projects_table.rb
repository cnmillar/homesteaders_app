class AddDurationColumnToProjectsTable < ActiveRecord::Migration
  def change
  	add_column :projects, :duration, :integer
  end
end
