class RecipesController < ApplicationController
  def show
    @recipes = Recipe.all
  end
end