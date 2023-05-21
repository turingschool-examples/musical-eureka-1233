class Recipe < ApplicationRecord
  validates_presence_of :name, :complexity, :genre
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
end