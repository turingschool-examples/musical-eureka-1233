require "rails_helper"

RSpec.describe Recipe, type: :model do
  before :each do
    @cake = Recipe.create!(name: "Cookies", complexity: 3, genre: "Desert")

    @milk = Ingredient.create!(name: "Milk", cost: 2)
    @flour = Ingredient.create!(name: "Flour", cost: 1)

    RecipeIngredient.create!(recipe: @cake, ingredient: @milk)
    RecipeIngredient.create!(recipe: @cake, ingredient: @flour)
  end
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe "relationships" do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end
  describe "#instance_Methods" do
    it 'shows the total cost of the ingrediants in the recipe' do
      expect(@cake.total_cost_ingredients).to eq(3)
    end
  end
end