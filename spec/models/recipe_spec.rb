require "rails_helper"

RSpec.describe Recipe, type: :model do
   
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe "relationships" do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe "class methods" do
    it "total_cost" do
      ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 2)
      ingredient_2 = Ingredient.create!(name: "Salt", cost: 4)
      ingredient_3 = Ingredient.create!(name: "Tomatoe Sauce", cost: 6)
  
      recipe_1 = Recipe.create!(name: "Spaghetti", complexity: 4, genre: "Italian")
      recipe_2 = Recipe.create!(name: "Hamburger", complexity: 1, genre: "American")

      RecipeIngredient.create!(recipe: recipe_1, ingredient: ingredient_1)
      RecipeIngredient.create!(recipe: recipe_1, ingredient: ingredient_2)
      RecipeIngredient.create!(recipe: recipe_1, ingredient: ingredient_3)

      RecipeIngredient.create!(recipe: recipe_2, ingredient: ingredient_1)
      RecipeIngredient.create!(recipe: recipe_2, ingredient: ingredient_2)

      expect(recipe_1.total_cost).to eq(12)
      expect(recipe_2.total_cost).to eq(6)
    end
 end
end