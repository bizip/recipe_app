class Recipe < ApplicationRecord
  has_many :recipe_foods, dependent: :nullify
  has_many :foods, through: :recipe_foods
  belongs_to :user
end
