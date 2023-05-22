class RecipesController < ApplicationController
  def show 
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
    @recipe_cost = @recipe.recipe_cost
  end
end