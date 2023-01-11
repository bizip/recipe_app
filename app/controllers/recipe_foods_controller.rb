class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:id])
    @recipe_food = RecipeFood.new
  end

  def destroy
    @recipe_food = RecipeFood.find_by(id: params[:food_id])

    if @recipe_food.destroy
      flash[:notice] = 'Recipe food deleted successfully!!'
    else
      flash[:alert] = 'Something unexpected happened, recipe could not be deleted.'
    end
    redirect_to user_recipe_path(params[:id])
  end

  def create
    food_list = params[:recipe_food][:food_list]
    food_list = food_list.drop(1)
    food_list.each do |food|
      next unless RecipeFood.where(food_id: food.to_i, recipe_id: params[:id]).blank?

      new_recipe_food = RecipeFood.new(food_id: food.to_i, quantity: params[:recipe_food][:quantity],
                                       recipe_id: params[:id])
      new_recipe_food.save
    end
    redirect_to user_recipe_path(params[:id]), flash: { success: 'Recipe food has been added successfully!' }
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:food_list, :quantity)
  end
end
