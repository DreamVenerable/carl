class CreateCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :ar_name
      t.string :image_path
      t.integer :sold_count
      t.integer :in_stock_count
      t.datetime :added_date

      t.timestamps
    end
  end
end
