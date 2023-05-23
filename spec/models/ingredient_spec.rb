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
      before(:each) do
         @ing1 = Ingredient.create!(name: "Lemon", cost: 2)
         @ing2 = Ingredient.create!(name: "Asparagus", cost: 1)
         @ing3 = Ingredient.create!(name: "Salmon", cost: 10)
      end

      it "sorts ingredients alphabetically" do
         expect(Ingredient.sort_ingredients_alpha).to eq([@ing2, @ing1, @ing3])
      end
   end

end