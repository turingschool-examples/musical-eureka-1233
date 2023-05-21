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
    before(:each) do
      @recipe1 = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
      @ingredient1 = Ingredient.create!(name: "Ground Beef", cost: 2)
      @ingredient2 = Ingredient.create!(name: "Salt", cost: 4)
      @ingredient3 = Ingredient.create!(name: "Pasta", cost: 5)
      @ingredient4 = Ingredient.create!(name: "Tomato", cost: 1)

      RecipeIngredient.create!(recipe_id: @recipe1.id, ingredient_id: @ingredient1.id)
      RecipeIngredient.create!(recipe_id: @recipe1.id, ingredient_id: @ingredient3.id)
      RecipeIngredient.create!(recipe_id: @recipe1.id, ingredient_id: @ingredient4.id)
    end

    it "#total_cost" do
      expect(@recipe1.total_cost).to eq(8)
    end
  end
end