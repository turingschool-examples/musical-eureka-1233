class RecipeIngredientsController < ApplicationController
  def create

    redirect_to "/recipes/#{recipe.id}"
  end
end