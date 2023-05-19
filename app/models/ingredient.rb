class Ingredient < ApplicationRecord
   validates_presence_of :name, :cost

   has_many :recipe_ingredients
   has_many :recipes, through: :recipe_ingredients

   def self.alpha_ingredients
      Ingredient.order(:name)
   end
end