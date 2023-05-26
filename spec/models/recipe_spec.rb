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

  describe "instance methods" do
    let!(:recipe_1) { Recipe.create!(name: "Meatball Sub", complexity: 2, genre: "Italian") }
    let!(:recipe_2) { Recipe.create!(name: "Grilled Cheese", complexity: 1, genre: "American") }

    let!(:ingredient_1) { Ingredient.create!(name: "Ground Beef", cost: 3) }
    let!(:ingredient_2) { Ingredient.create!(name: "Bread", cost: 1) }
    let!(:ingredient_3) { Ingredient.create!(name: "Cheese", cost: 2) }
    let!(:ingredient_4) { Ingredient.create!(name: "Marinara Sauce", cost: 1) }

    let!(:recipe_ingredient_1) { RecipeIngredient.create!(recipe: recipe_1, ingredient: ingredient_1) }
    let!(:recipe_ingredient_2) { RecipeIngredient.create!(recipe: recipe_1, ingredient: ingredient_2) }
    let!(:recipe_ingredient_3) { RecipeIngredient.create!(recipe: recipe_1, ingredient: ingredient_3) }
    let!(:recipe_ingredient_4) { RecipeIngredient.create!(recipe: recipe_1, ingredient: ingredient_4) }

    let!(:recipe_ingredient_5) { RecipeIngredient.create!(recipe: recipe_2, ingredient: ingredient_2) }
    let!(:recipe_ingredient_6) { RecipeIngredient.create!(recipe: recipe_2, ingredient: ingredient_3) }

    context "#total_cost" do
      it "returns the total cost of all ingredients in a recipe" do
        expect(recipe_1.total_cost).to eq(7)
        expect(recipe_2.total_cost).to eq(3)
      end
    end
  end
end