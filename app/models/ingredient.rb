class Ingredient < ApplicationRecord
  validates_presence_of :name, :cost
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  def self.sort_alphabetically(sort)
    if sort == 'yeahbaby'
      self.order(name: :asc)
    else
      self.all
    end
  end
end