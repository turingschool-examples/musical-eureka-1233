class Recipe < ApplicationRecord
   validates_presence_of :name, :complexity, :genre
   have_many :recipe_ingredients
   have_many :ingredients, through: :recipe_ingredients
end