class VehicleModel < ApplicationRecord
  belongs_to :vehicle_make
  has_many :vehicle_years
  has_many :fitments
end
