require "rails_helper"

RSpec.describe Recipe, type: :model do
  before(:each) do 
    @recipe_1 = Recipe.create!(name: "Vegan Meatball Soup", complexity:4, genre: "Soups")
    @ingredient_1 = @recipe_1.ingredients.create!(name: "TVP", cost: 3)
    @ingredient_2 = @recipe_1.ingredients.create!(name: "Celery", cost: 1)
    @ingredient_3 = @recipe_1.ingredients.create!(name: "Carrots", cost: 2)
    @ingredient_4 = @recipe_1.ingredients.create!(name: "Parsnips", cost: 1)
    @ingredient_5 = @recipe_1.ingredients.create!(name: "Vital Wheat Gluten", cost: 3)
    @ingredient_6 = @recipe_1.ingredients.create!(name: "Onion", cost: 4)
    @ingredient_7 = @recipe_1.ingredients.create!(name: "Garlic", cost: 2)
    @ingredient_8 = @recipe_1.ingredients.create!(name: "Fennel", cost: 2)
    @ingredient_9 = @recipe_1.ingredients.create!(name: "Liquid Smoke", cost: 5)
  end

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
    it "#recipe_cost" do 
      expect(@recipe_1.recipe_cost).to eq(23)
    end
  end
end