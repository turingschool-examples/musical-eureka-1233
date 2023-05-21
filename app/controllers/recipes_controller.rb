class RecipesController <ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @recipe_cost = Recipe.find(params[:id]).total_cost
  end

  def create
    
  end
end