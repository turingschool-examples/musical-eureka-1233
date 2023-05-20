require "rails_helper"

RSpec.describe Ingredient, type: :model do

   describe "validations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :cost }
   end

   describe "relationships" do
      it { should have_many :recipe_ingredients }
      it { should have_many(:recipes).through(:recipe_ingredients) }
   end

    describe "total_cost" do
      it "can total the cost of ingredients" do
        ingredient_1 = Ingredient.create!(name: "Garlic Powder", cost: 1)
        ingredient_2 = Ingredient.create!(name: "Beans", cost: 3)
        
        expect(Ingredient.total_cost).to eq(4)
      end
    end

    describe "sort_alphabetical" do
      it "sorts ingredients alphabetically" do
        ingredient_1 = Ingredient.create!(name: "Garlic Powder", cost: 1)
        ingredient_2 = Ingredient.create!(name: "Beans", cost: 3)

        original = [ingredient_1, ingredient_2]
        expected = [ingredient_2, ingredient_1]

        expect(Ingredient.all).to eq(original)
        expect(Ingredient.sort_alphabetical).to eq(expected)
      end
    end
end