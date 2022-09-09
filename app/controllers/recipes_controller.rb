class RecipesController < ApplicationController
  load_and_authorize_resource
  before_action :set_recipe, only: %i[show delete]
  before_action :authenticate_user!, only: %i[new create destroy]
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

    if @recipe.save
      redirect_to user_recipes_path
    else
      render :new
    end
  end

  def destroy
    @recipe.destroy

    redirect_to user_recipes_path
  end

  def show
    @user = current_user
    @recipe = @user.recipes.find(params[:id])
    @foods = @recipe.recipe_foods.includes(:food)
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
