class Meal < ApplicationRecord
  has_many :meal_sizes
  belongs_to :restaurant
end
