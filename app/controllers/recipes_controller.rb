class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  private
    def recipe_params
      params.permit(:name, :complexity, :genre)
    end
end