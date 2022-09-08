class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :delete]
    def index
      @recipes = Recipe.all
    end

    def new
      @user = User.find(params[:user_id])
      @recipe = Recipe.new
    end

    def create 
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id

    if @recipes.save
        redirect_to user_recipes_path
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
    params.permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
