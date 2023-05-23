class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.sort_ingredients_alpha
  end
end