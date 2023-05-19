require "rails_helper"

RSpec.describe Recipe, type: :model do
  before(:each) do
    test_data
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

  describe "instance methods" do
    describe "#total_cost" do
      it "can determine the total cost of a recipe" do
        expect(@burger.total_cost).to eq(12)
        expect(@gc.total_cost).to eq(5)
        expect(@struggle.total_cost).to eq(3)
      end
    end
  end
end