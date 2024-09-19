class Engine < ApplicationRecord
  belongs_to :vehicle_model
  belongs_to :vehicle_year
  has_many :fitments
end
