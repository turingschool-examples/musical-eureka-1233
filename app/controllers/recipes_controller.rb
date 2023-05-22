class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = @recipe.ingredients
    @total_cost = @recipe.total_cost_ingredients
  end
end