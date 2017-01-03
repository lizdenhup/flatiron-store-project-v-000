class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :inventory
      t.float :price
      t.references :categories, index: true 
    end 
  end
end
