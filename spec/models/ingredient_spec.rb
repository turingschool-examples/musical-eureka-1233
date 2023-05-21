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

   describe "order_by_name" do
      it "displays ingredients in alpha order" do
         garlic = Ingredient.create!(name: "garlic", cost: 1)
         turkey = Ingredient.create!(name: "ground turkey", cost: 6)
         pasta = Ingredient.create!(name: "penne", cost: 3)
      
         ingredients = Ingredient.order_by_name

         expect(ingredients).to eq([garlic, turkey, pasta])
      end
   end

end