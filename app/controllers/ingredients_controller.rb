class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all.sort_alpha
  end
end