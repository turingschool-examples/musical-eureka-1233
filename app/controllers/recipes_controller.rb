class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
    @total_cost = @ingredients.sum(:cost)
  end
end