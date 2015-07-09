class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.boolean :admin
    	t.string :username
    	t.string :email
    	t.string :password
    	t.string :avatar
    end
  end

  def change
    create_table :projects do |t|
    	t.string :title
    	t.string :description
    	t.string :video
    	t.integer :difficulty
    	t.integer :batch_size
    	t.string :batch_unit
    	t.float :avg_rating
    	t.ingeter :kit_id
    end
  end

  def change
    create_table :comments do |t|
    	t.string :content
    	t.string :comment_object
    	t.integer :comment_object_id
    end
  end

   def change
    create_table :galleries do |t|
    	t.string :original_image
    	t.string :resized_image
    	t.string :description
    end
  end

  def change
    create_table :ingredients do |t|
    	t.string :name
    	t.integer :shopify_id
    	t.integer :unit_size
    	t.string :unit_measure
    	t.boolean :availability
    end
  end

  def change
    create_table :steps do |t|
    	t.integer :ordinal
    	t.string :content
    end
  end

   def change
    create_table :categories do |t|
    	t.string :name
    	t.string :description
    end
  end

end
