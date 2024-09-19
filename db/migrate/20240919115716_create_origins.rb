class CreateOrigins < ActiveRecord::Migration[7.2]
  def change
    create_table :origins do |t|
      t.string :origin_name
      t.string :origin_name_ar
      t.references :vehicle_model, foreign_key: true

      t.timestamps
    end
  end
end
