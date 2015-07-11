class ChangeUnitSizeType < ActiveRecord::Migration
  def change
  	change_column(:ingredients, :unit_size, :float)
  end
end
