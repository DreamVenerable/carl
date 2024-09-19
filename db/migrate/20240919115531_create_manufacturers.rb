class CreateManufacturers < ActiveRecord::Migration[7.2]
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.string :ar_name
      t.string :image_path

      t.timestamps
    end
  end
end
