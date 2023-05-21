class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = Ingredient.all
    @total_cost = @ingredients.total_cost
  end
end
