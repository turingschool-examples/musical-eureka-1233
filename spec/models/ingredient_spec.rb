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

   describe "class methods" do
      let!(:ingredient_1) { Ingredient.create!(name: "Ground Beef", cost: 3) }
      let!(:ingredient_2) { Ingredient.create!(name: "Bread", cost: 1) }
      let!(:ingredient_3) { Ingredient.create!(name: "Cheese", cost: 2) }

      context ".order_by_name" do
         it "lists ingredients alphabetically" do
            expect(Ingredient.order_by_name).to eq([ingredient_2, ingredient_3, ingredient_1])
         end
      end
   end
end
