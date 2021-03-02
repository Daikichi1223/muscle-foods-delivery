class Meal < ApplicationRecord
  belongs_to :shop
  has_one_attached :image
end
