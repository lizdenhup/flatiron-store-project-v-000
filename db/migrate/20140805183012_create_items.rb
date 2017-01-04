class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.integer :inventory
      t.float :price
      t.references :category, index: true 
    end 
  end
end
