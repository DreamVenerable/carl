class VehicleYear < ApplicationRecord
  belongs_to :vehicle_model
  has_many :fitments, dependent: :destroy
end
