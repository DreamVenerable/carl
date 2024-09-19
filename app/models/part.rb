class Part < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :variations, through: :products, dependent: :destroy
end
