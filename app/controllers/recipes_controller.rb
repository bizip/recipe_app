class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :delete]
    def index
      @recipes = Recipe.all
    end

    def new 
        @recipes = Recipe.new
    end

    def create 
    @recipes = Recipe.new(recipe_params)
    @recipes.user_id = current_user.id

    if @recipes.save
        redirect_to recipes_path 
    else
        render :new
    end
  end

  def destroy
    @recipe.destroy
  end

  def show; end

   private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
