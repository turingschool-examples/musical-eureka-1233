class RecipeIngredientsController < ApplicationController
  def update
    redirect = Recipe.find(params[:id])
    require 'pry'; binding.pry
    recipe = Recipe.create!(name: params[:name], cost: params[:cost])
    RecipeIngredient.create!(recipe_id: redirect.id, ingredient_id: recipe.id)

    redirect_to "/recipes/#{recipe.id}"
    recipe_ingredients = RecipeIngredient.find(@recipe.id)
  end
end