class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.alphabetically
  end
end