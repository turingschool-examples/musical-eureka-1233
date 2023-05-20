require "rails_helper"

RSpec.describe Ingredient, type: :model do
  let!(:ingredient_1) { Ingredient.create!(name: "Garlic Powder", cost: 1)}
  let!(:ingredient_2) { Ingredient.create!(name: "Beans", cost: 3)}

   describe "validations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :cost }
   end

   describe "relationships" do
      it { should have_many :recipe_ingredients }
      it { should have_many(:recipes).through(:recipe_ingredients) }
   end

  it "can count the total cost of all ingredients" do
    expect(Ingredient.total_cost).to eq(4)
  end
end