class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @cost_recipe = @recipe.total_cost
  end
end