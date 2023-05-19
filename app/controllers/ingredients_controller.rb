class IngredientsController < ApplicationController

  def index 
    @ingredients = Ingredient.all.order(:name) 
  end
end