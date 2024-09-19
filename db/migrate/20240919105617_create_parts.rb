class CreateParts < ActiveRecord::Migration[7.2]
  def change
    create_table :parts do |t|
      t.references :part, foreign_key: true
      t.string :name
      t.string :ar_name
      t.string :image_path
      t.datetime :added_date

      t.timestamps
    end
  end
end
