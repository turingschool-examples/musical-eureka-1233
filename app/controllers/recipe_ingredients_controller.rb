class RecipeIngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

end