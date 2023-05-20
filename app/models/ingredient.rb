class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  validates_presence_of :name, :cost

  def self.total_cost
    @ingredients = Ingredient.all
    cost = @ingredients.sum { |ingredient| ingredient.cost }
  end
end