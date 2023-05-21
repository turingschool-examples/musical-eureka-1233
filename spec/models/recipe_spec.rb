require "rails_helper"

RSpec.describe Recipe, type: :model do
   
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe "relationships" do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe '#total_cost' do
    let!(:recipe_1) { Recipe.create!(name: "baked ziti", complexity: 2, genre: "italian") }
    let!(:recipe_2) { Recipe.create!(name: "tamale pie", complexity: 1, genre: "mexican") }
    
    let!(:garlic) { recipe_1.ingredients.create!(name: "garlic", cost: 1) }
    let!(:turkey) { recipe_1.ingredients.create!(name: "ground turkey", cost: 6) }
    let!(:pasta) { recipe_1.ingredients.create!(name: "penne", cost: 3) }

    it 'calculates total cost of a recipes ingredients' do
      expect(recipe_1.total_cost).to eq(10)
    end
  end
end