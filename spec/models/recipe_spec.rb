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
      @ingredient_1 = Ingredient.create!(name: "Lemon", cost: 2)
      @ingredient_2 = Ingredient.create!(name: "Asparagus", cost: 1)
      @ingredient_3 = Ingredient.create!(name: "Salmon", cost: 10)

      @ingredient_4 = Ingredient.create!(name: "Sauce", cost: 4)
      @ingredient_5 = Ingredient.create!(name: "Spaghetti", cost: 2)
      @ingredient_6 = Ingredient.create!(name: "Ground Beef", cost: 7)

      @ingredient_7 = Ingredient.create!(name: "Salt", cost: 4)
      @ingredient_8 = Ingredient.create!(name: "Pepper", cost: 4)
      @ingredient_9 = Ingredient.create!(name: "Avocado Oil", cost: 4)

      @recipe_1 = Recipe.create!(name: "Tangy Salmon", complexity: 5, genre: "Mediterranean")
      @recipe_2 = Recipe.create!(name: "Tried and True", complexity: 2, genre: "Italian")
      @recipe_3 = Recipe.create!(name: "Avo Asparagus", complexity: 1, genre: "Sides")

      # Tangy Salmon
      @rec_ing_1 = RecipeIngredient.create!(recipe_id: @recipe_1.id, ingredient_id: @ingredient_1.id)
      @rec_ing_2 = RecipeIngredient.create!(recipe_id: @recipe_1.id, ingredient_id: @ingredient_2.id)
      @rec_ing_3 = RecipeIngredient.create!(recipe_id: @recipe_1.id, ingredient_id: @ingredient_3.id)
      @rec_ing_4 = RecipeIngredient.create!(recipe_id: @recipe_1.id, ingredient_id: @ingredient_7.id)
      @rec_ing_5 = RecipeIngredient.create!(recipe_id: @recipe_1.id, ingredient_id: @ingredient_8.id)
      @rec_ing_6 = RecipeIngredient.create!(recipe_id: @recipe_1.id, ingredient_id: @ingredient_9.id)

      # Tried and True
      @rec_ing_7 = RecipeIngredient.create!(recipe_id: @recipe_2.id, ingredient_id: @ingredient_4.id)
      @rec_ing_8 = RecipeIngredient.create!(recipe_id: @recipe_2.id, ingredient_id: @ingredient_5.id)
      @rec_ing_9 = RecipeIngredient.create!(recipe_id: @recipe_2.id, ingredient_id: @ingredient_6.id)
      @rec_ing_10 = RecipeIngredient.create!(recipe_id: @recipe_2.id, ingredient_id: @ingredient_7.id)
      @rec_ing_11 = RecipeIngredient.create!(recipe_id: @recipe_2.id, ingredient_id: @ingredient_8.id)

      # Avo Asparagus
      @rec_ing_12 = RecipeIngredient.create!(recipe_id: @recipe_3.id, ingredient_id: @ingredient_1.id)
      @rec_ing_13 = RecipeIngredient.create!(recipe_id: @recipe_3.id, ingredient_id: @ingredient_2.id)
      @rec_ing_14 = RecipeIngredient.create!(recipe_id: @recipe_3.id, ingredient_id: @ingredient_7.id)
      @rec_ing_15 = RecipeIngredient.create!(recipe_id: @recipe_3.id, ingredient_id: @ingredient_8.id)
      @rec_ing_16 = RecipeIngredient.create!(recipe_id: @recipe_3.id, ingredient_id: @ingredient_9.id)
    end

    it "returns the sum of the cost of all ingredients" do
      expect(@recipe_1.total_cost).to eq(25)
      expect(@recipe_2.total_cost).to eq(21)
      expect(@recipe_3.total_cost).to eq(15)
    end
  end
end