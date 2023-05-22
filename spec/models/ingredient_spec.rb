require "rails_helper"

RSpec.describe Ingredient, type: :model do
   before :each do
      @milk = Ingredient.create!(name: "Milk", cost: 2)
      @flour = Ingredient.create!(name: "Flour", cost: 1)
   end
   describe "validations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :cost }
   end

   describe "relationships" do
      it { should have_many :recipe_ingredients }
      it { should have_many(:recipes).through(:recipe_ingredients) }
   end

   describe '#class_methods' do
      describe '#alphabetically' do
         it 'shows the ingredients in alphabetical order' do
            expect(Ingredient.alphabetically).to eq([@flour, @milk])
         end
      end
   end
end