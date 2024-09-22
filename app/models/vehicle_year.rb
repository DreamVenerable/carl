class VehicleYear < ApplicationRecord
  belongs_to :vehicle_model
  has_many :fitments, dependent: :destroy
  has_many :products, through: :fitments, dependent: :destroy
  has_many :engines, dependent: :destroy
end
