class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :part_number
      t.string :oem_number
      t.references :part_id, foreign_key: true
      t.references :manufacturer_id, foreign_key: true
      t.float :retail_price_lyd
      t.float :base_price_lyd
      t.float :base_price_usd
      t.float :retail_price_usd
      t.integer :stock_quantity
      t.integer :sold_quantity
      t.datetime :start_date_availability
      t.datetime :end_date_availability
      t.boolean :is_external
      t.integer :shipping_days_from
      t.integer :shipping_days_to
      t.string :status
      t.string :warranty
      t.boolean :universal_fit
      t.string :image_path

      t.timestamps
    end
  end
end
