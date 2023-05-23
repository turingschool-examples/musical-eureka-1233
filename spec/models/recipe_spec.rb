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
    describe "#total_cost" do
      before(:each) do
        @beef = Ingredient.create!(name: "Ground Beef", cost: 2)
        @salt = Ingredient.create!(name: "Salt", cost: 4)
        @flour = Ingredient.create!(name: "Flour", cost: 6)
    
        @recipe1 = Recipe.create!(name: "Pasta", complexity: 2, genre: "Italian")
        @recipe2 = Recipe.create!(name: "Meat Pie", complexity: 1, genre: "English")
    
        @recipe1_ingredient1 = RecipeIngredient.create!(recipe_id: @recipe1.id, ingredient_id: @beef.id)
        @recipe1_ingredient2 = RecipeIngredient.create!(recipe_id: @recipe1.id, ingredient_id: @salt.id)
        @recipe1_ingredient3 = RecipeIngredient.create!(recipe_id: @recipe1.id, ingredient_id: @flour.id)
    
        @recipe2_ingredient1 = RecipeIngredient.create!(recipe_id: @recipe2.id, ingredient_id: @beef.id)
        @recipe2_ingredient2 = RecipeIngredient.create!(recipe_id: @recipe2.id, ingredient_id: @flour.id)
      
      end
      it "finds the total cost of ingredients for the recipe" do
        expect(@recipe1.total_cost).to eq(12)

        expect(@recipe2.total_cost).to eq(8)
      end
    end
  end
end