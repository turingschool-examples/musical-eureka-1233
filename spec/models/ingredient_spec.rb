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

   describe "alphabetical sort" do 
    it 'sort alphabetically' do 
      salt = Ingredient.create!(name: 'salt', cost: 2)
      onion = Ingredient.create!(name: 'onion', cost: 4)
      cornmeal = Ingredient.create!(name: 'cornmeal', cost: 10)
      fatback = Ingredient.create!(name: 'fatback', cost: 8)

      expect(Ingredient.sort_alphabetically('yeahbaby')).to eq([cornmeal, fatback, onion, salt])
      expect(Ingredient.sort_alphabetically('nobaby')).to eq([salt, onion, cornmeal, fatback])
    end
   end
end