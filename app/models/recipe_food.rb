class RecipeFood < ApplicationRecord
  belongs_to :recipe, class_name: "recipe", foreign_key: "recipe_id"
  belongs_to :food
end
