class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  def self.total_cost(array)
    array.sum do |ingredient|
      ingredient.cost
    end
 end
end