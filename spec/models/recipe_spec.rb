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

  before(:each) do
    @filet_mignon = Recipe.create!(name: "Filet Mignon", complexity: 5, genre: "Fancy")
    @spaghetti = Recipe.create!(name: "Spaghetti", complexity: 1, genre: "Italian")

    @filet_mignon_meat = @filet_mignon.ingredients.create!(name: "Filet Mignon Meat", cost: 50)
    @butter = @filet_mignon.ingredients.create!(name: "Butter", cost: 2)
    @noodles = @spaghetti.ingredients.create!(name: "Noodles", cost: 4)
    @sauce = @spaghetti.ingredients.create!(name: "Sauce", cost: 3)
  end

  describe "#total_cost" do
    it "calculates the total cost of all ingredients in a recipe" do
      expect(@filet_mignon.total_cost).to eq(52)
      expect(@spaghetti.total_cost).to eq(7)
    end
  end
end