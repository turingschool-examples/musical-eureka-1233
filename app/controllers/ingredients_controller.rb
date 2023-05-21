class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
    @sorted_ingredients = Ingredient.sorts_a_z
  end
end