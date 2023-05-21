require "rails_helper"

RSpec.describe Ingredient, type: :model do
   let!(:chicken) {Ingredient.create!(name: "Chicken", cost: 10)}
   let!(:ravioli) {Ingredient.create!(name: "Ravioli", cost: 2)}
   let!(:cheese) {Ingredient.create!(name: "Parmesan", cost:5)}
   let!(:sauce) {Ingredient.create!(name: "Marinara", cost:3)}
   let!(:bread_crumbs) {Ingredient.create!(name: "Bread Crumbs", cost:1)}

   describe "validations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :cost }
   end

   describe "relationships" do
      it { should have_many :recipe_ingredients }
      it { should have_many(:recipes).through(:recipe_ingredients) }
   end

   describe "Sorts Ingredients Alphabetically" do
      it "# sorts_a_z" do
         expect(Ingredient.sorts_a_z).to eq [bread_crumbs, chicken, sauce, cheese, ravioli]
      end
   end

end