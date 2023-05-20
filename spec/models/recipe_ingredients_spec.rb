require "rails_helper"

RSpec.describe RecipeIngredient, type: :model do

  describe "relationships" do
    it { should belong_to :recipe }
    it { should belong_to :ingredient }
  end

  describe "class method" do
    before(:each) do
      @rec1 = Recipe.create!(name: "Tacos", complexity: 5, genre: "Mexican")
      @ing1 = Ingredient.create!(name: "Ground Beef", cost: 2)
      @ing2 = Ingredient.create!(name: "Salt", cost: 4)
      @recing1 = RecipeIngredient.create!(recipe_id: @rec1.id, ingredient_id: @ing1.id)
      @recing1 = RecipeIngredient.create!(recipe_id: @rec1.id, ingredient_id: @ing2.id)
    end
    it "returns total cost of ingredients" do
      expect(RecipeIngredient.total_cost).to eq(6)
    end
  end
end