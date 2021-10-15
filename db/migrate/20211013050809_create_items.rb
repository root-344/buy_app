class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product
      t.references :farm
      t.text :description
      t.integer :category_id
      t.integer :states_id
      t.integer :shipping_fee_id
      t.integer :region_id
      t.integer :eta_id
      t.integer :price
      t.timestamps
    end
  end
end
