class CreateVehicleMakes < ActiveRecord::Migration[7.2]
  def change
    create_table :vehicle_makes do |t|
      t.string :make_name
      t.string :make_name_ar

      t.timestamps
    end
  end
end
