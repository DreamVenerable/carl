class Part < ApplicationRecord
  has_many :products
  has_many :variations, through: :products
end
