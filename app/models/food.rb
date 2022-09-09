class Food < ApplicationRecord
    has_many :recipe_foods, dependent: :nullify
    has_many :recipes, through: :recipe_foods
end
