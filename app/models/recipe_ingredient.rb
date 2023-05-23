class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  def self.find_ingredients(query_id)
    where("recipe_id = #{query_id}")
  end
end