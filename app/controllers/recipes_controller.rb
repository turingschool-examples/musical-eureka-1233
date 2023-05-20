class RecipesController < ApplicationController
  def show 
    @recipe = Recipe.find(params[:id])
    @ingredient = RecipeIngredient.where(recipe: @recipe.id)
  end
end