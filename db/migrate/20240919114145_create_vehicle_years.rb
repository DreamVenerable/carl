class CreateVehicleYears < ActiveRecord::Migration[7.2]
  def change
    create_table :vehicle_years do |t|
      t.string :year
      t.references :vehicle_model, foreign_key: true

      t.timestamps
    end
  end
end
