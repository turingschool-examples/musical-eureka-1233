class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = Ingredient.all
    @total_cost = @recipe.total_cost
  end

  def update 
  end
end
