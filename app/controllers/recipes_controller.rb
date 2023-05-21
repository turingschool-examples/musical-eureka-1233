class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
  end

  private
    def recipe_params
      params.permit(:id, :name, :complexity, :genre)
    end
end