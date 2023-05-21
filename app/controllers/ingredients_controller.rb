class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
    @ordered_ingredients = @ingredients.alphabetical 
  end
end
