class RecipeIngredientsController < ApplicationController
  def create
    recipe = Recipe.find(params[:id])
    ingredient = Ingredient.find(params[:ingredient_id])

    RecipeIngredient.create!(recipe: recipe, ingredient: ingredient)
    redirect_to "/recipes/#{recipe.id}"
  end
end
