class VehicleModel < ApplicationRecord
  belongs_to :vehicle_make
  has_many :origins, dependent: :destroy
  has_many :fitments, dependent: :destroy
  has_many :products, through: :fitments, dependent: :destroy
  has_many :vehicle_years, dependent: :destroy
end
