class Engine < ApplicationRecord
  belongs_to :vehicle_model
  belongs_to :vehicle_year
  has_many :fitments, dependent: :destroy
  has_many :products, through: :fitments, dependent: :destroy
end
