class IngredientsController < ApplicationController
  def index
    # require 'pry'; binding.pry
    @ingredients = Ingredient.all
  end
end
