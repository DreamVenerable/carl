class CreateVariations < ActiveRecord::Migration[7.2]
  def change
    create_table :variations do |t|
      t.references :product_id, foreign_key: true
      t.string :variation_name
      t.string :variation_value
      t.string :variation_name_ar
      t.string :variation_value_ar

      t.timestamps
    end
  end
end
