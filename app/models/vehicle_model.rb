class VehicleModel < ApplicationRecord
  belongs_to :vehicle_make
  has_many :vehicle_years, dependent: :destroy
  has_many :fitments, dependent: :destroy
end
