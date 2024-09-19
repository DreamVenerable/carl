class Category < ApplicationRecord
  has_many :parts, dependent: :destroy
end
