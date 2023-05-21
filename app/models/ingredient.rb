class Ingredient < ApplicationRecord
   validates_presence_of :name, :cost

   has_many :recipe_ingredients
   has_many :recipes, through: :recipe_ingredients

   def self.total_cost
      @all_ingredients = Ingredient.all
      @ingredients_cost = []
      @all_ingredients.each do |ingredient|
         @ingredients_cost << ingredient.cost
      end
      @total_cost = @ingredients_cost.sum
   end
end
