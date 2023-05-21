class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.sort_alphabetically(params[:sort])
  end
end