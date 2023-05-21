class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def new
  end

end