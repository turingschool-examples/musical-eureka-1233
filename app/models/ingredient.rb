class Ingredient < ApplicationRecord
  validates_presence_of :name, :cost
  has_many :recipe_ingredients
end