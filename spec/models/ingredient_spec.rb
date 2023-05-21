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
      describe "#calulate_cost" do
         it "calculates cost of all ingredients" do
            beef = Ingredient.create!(name: "Ground Beef", cost: 2)
            salt = Ingredient.create!(name: "Salt", cost: 4)
            penuts = Ingredient.create!(name: "Penut", cost: 7)

            expect(Ingredient.calculate_cost).to eq(13)
         end
      end
   end

end