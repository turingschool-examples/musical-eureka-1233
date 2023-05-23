class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients_cost = @recipe.total_cost
  end

end