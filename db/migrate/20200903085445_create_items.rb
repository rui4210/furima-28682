class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                  nule: false
      t.text :description,             nule: false
      t.integer :price,                nule: false
      t.integer :category_id,          null: false
      t.integer :product_status_id,    null: false
      t.integer :shipping_charges_id,  null: false
      t.integer :shipping_region_id,   null: false
      t.integer :shipping_day_id,      null: false
      t.timestamps
    end
  end
end

#imageカラムを消す。