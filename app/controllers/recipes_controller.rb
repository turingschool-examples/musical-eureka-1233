class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = RecipeIngredient.where(recipe: @recipe.id)
  end
end