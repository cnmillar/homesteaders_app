class AddShopifyUnitColumn < ActiveRecord::Migration
  def change
  	add_column :ingredients, :shopify_unit, :integer
  	add_column :projects, :duration_unit, :string
  end
end
