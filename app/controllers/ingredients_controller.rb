class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.alpha_ingredients
  end
end