class Product < ApplicationRecord
  belongs_to :part
  belongs_to :manufacturer
  has_many :variations, dependent: :destroy
  has_many :fitments, dependent: :destroy
  has_many :vehicle_models, through: :fitments, dependent: :destroy
  has_many :vehicle_years, through: :fitments, dependent: :destroy
end
