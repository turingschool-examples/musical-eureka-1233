class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  def self.total_cost
    joins(:ingredient).sum("ingredients.cost")
  end
end