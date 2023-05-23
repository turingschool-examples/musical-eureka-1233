require "rails_helper"

RSpec.describe Ingredient, type: :model do
   let!(:risotto) { Recipe.create!(name: "Truffle Risotto", complexity: 8, genre: "Italian") }

   let!(:ing_1) { Ingredient.create!(name: "Arborio Rice", cost: 10) }
   let!(:ing_2) { Ingredient.create!(name: "Pinot Grigio", cost: 7) }
   let!(:ing_3) { Ingredient.create!(name: "Soy Cream Cuisine", cost: 2) }

   let!(:rec_ing1) { RecipeIngredient.create!(recipe_id: risotto.id, ingredient_id: ing_1.id) }
   let!(:rec_ing2) { RecipeIngredient.create!(recipe_id: risotto.id, ingredient_id: ing_2.id) }
   let!(:rec_ing3) { RecipeIngredient.create!(recipe_id: risotto.id, ingredient_id: ing_3.id) }

   describe "validations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :cost }
   end

   describe "relationships" do
      it { should have_many :recipe_ingredients }
      it { should have_many(:recipes).through(:recipe_ingredients) }
   end

   describe "class methods" do   
      it "::total_cost" do
         expect(risotto.ingredients.total_cost).to eq(19)
      end
   end
end