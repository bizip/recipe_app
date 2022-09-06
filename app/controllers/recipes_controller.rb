class RecipesController < ApplicationController
    def index; end

    def new 
        @recipes = Recipe.new
    end
  end