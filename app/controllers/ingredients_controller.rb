class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.order_alpha
  end
end