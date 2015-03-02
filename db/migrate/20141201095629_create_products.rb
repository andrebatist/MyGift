class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :price, precision: 8, scale: 2 # 8 знаков в целой части, 2 после запятой 

      t.timestamps
    end
  end
end

