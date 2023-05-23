class RecipesController < ApplicationController
  def show
    @recipes = Recipe.find(params[:id])
  end
end