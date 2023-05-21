class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  private
    def recipe_params
      params.permit(:id, :name, :complexity, :genre)
    end
end