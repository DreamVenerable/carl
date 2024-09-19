class RenameForeignKeyColumns < ActiveRecord::Migration[7.2]
  def change
    rename_column :products, :part_id_id, :part_id
    rename_index :products, 'index_products_on_part_id_id', 'index_products_on_part_id'
    rename_column :products, :manufacturer_id_id, :manufacturer
    rename_index :products, 'index_products_on_manufacturer_id_id', 'index_products_on_manufacturer_id'
    rename_column :variations, :product_id_id, :product
    rename_index :variations, 'index_variations_on_product_id_id', 'index_variations_on_product_id'
    rename_column :fitments, :product_id_id, :product_id
    rename_index :fitments, 'index_fitments_on_product_id_id', 'index_fitments_on_product_id'
    rename_column :fitments, :engine_id_id, :engine_id
    rename_index :fitments, 'index_fitments_on_engine_id_id', 'index_fitments_on_engine_id'
  end
end
