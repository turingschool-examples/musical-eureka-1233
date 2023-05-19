class RecipeIngredientsController < ApplicationController
  def show
    @recipe = Recipe.find(params[:recipe_id])
    @ingredients = @recipe.ingredients
  end
end