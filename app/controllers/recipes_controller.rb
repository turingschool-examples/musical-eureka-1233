class RecipesController < ApplicationController
  def show 
    @recipe = Recipe.find(params[:id])
    @ingredients = Recipe.ingredients
  end
end