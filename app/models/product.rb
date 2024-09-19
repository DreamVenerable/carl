class Product < ApplicationRecord
  belongs_to :part
  belongs_to :manufacturer
  has_many :variations
  has_many :fitments
end
