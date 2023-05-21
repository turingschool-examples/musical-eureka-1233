class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.order_by_name
  end

  def new
  end

end