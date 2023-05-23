class Ingredient < ApplicationRecord
   validates_presence_of :name, :cost
   has_many :recipe_ingredients
   has_many :recipes, through: :recipe_ingredients
end

# class Pet < ApplicationRecord
#    validates :name, presence: true
#    validates :age, presence: true, numericality: true
#    belongs_to :shelter
#    has_many :pet_applications
#    has_many :applications, through: :pet_applications