require "rails_helper"

RSpec.describe Ingredient, type: :model do
   before(:each) do
      test_data
   end

   describe "validations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :cost }
   end

   describe "relationships" do
      it { should have_many :recipe_ingredients }
      it { should have_many(:recipes).through(:recipe_ingredients) }
   end

   describe "class methods" do
      describe "#alpha_ingredients" do
        it "can list all ingredients in alphabetical order" do
          expect(Ingredient.alpha_ingredients).to eq([@tomato, @bread, @bun, @beef, @cheese])
        end
      end
    end
end