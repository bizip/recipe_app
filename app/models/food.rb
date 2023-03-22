class Food < ApplicationRecord
  has_many :recipe_food, dependent: :destroy
  has_many :inventory_food, dependent: :destroy
end
