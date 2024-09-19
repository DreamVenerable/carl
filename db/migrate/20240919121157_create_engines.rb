class CreateEngines < ActiveRecord::Migration[7.2]
  def change
    create_table :engines do |t|
      t.string :engine_power
      t.references :vehicle_model, foreign_key: true
      t.references :vehicle_year, foreign_key: true
      t.integer :power_kw
      t.integer :power_ps
      t.string :fuel_type

      t.timestamps
    end
  end
end
