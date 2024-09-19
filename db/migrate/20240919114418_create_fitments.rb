class CreateFitments < ActiveRecord::Migration[7.2]
  def change
    create_table :fitments do |t|
      t.references :product_id, foreign_key: true
      t.references :vehicle_year, foreign_key: true
      t.references :vehicle_model, foreign_key: true
      t.references :engine_id, foreign_key: true

      t.timestamps
    end
  end
end
