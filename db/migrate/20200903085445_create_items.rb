class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :image,               nule: false
      t.string :name,              nule: false
      t.text :description,         nule: false
      t.integer :category,         nule: false
      t.integer :product_status,   nule: false
      t.integer :shipping_charges, nule: false
      t.integer :shipping_region,  nule: false
      t.integer :shipping_day,     nule: false
      t.integer :price,            nule: false
      t.timestamps
    end
  end
end
