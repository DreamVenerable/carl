class Fitment < ApplicationRecord
  belongs_to :product
  belongs_to :vehicle_year
  belongs_to :vehicle_model
  belongs_to :engine
  belongs_to :origin
end
