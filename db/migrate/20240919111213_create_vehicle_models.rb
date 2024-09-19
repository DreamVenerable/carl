class CreateVehicleModels < ActiveRecord::Migration[7.2]
  def change
    create_table :vehicle_models do |t|
      t.string :name_model
      t.string :model_name_ar
      t.references :vehicle_make, foreign_key: true

      t.timestamps
    end
  end
end
