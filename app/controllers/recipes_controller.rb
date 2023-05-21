class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @total_cost = @recipe.ingredients.sum(:cost)
  end
end