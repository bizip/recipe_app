class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.includes(:user).order(created_at: :desc)
  end
end
