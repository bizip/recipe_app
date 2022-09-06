class RecipesController < ApplicationController
    def index
      @recipes = Recipe.all
    end

    def new 
        @recipes = Recipe.new
    end

    def create 
    @recipes = Recipe.new
    @recipes.user_id = current_user.id

    if @recipes.save
        redirect_to recipes_path 
    else
            render :new
    end
  end
end
