require "rails_helper"

RSpec.describe Ingredient, type: :model do
   before(:each) do 
      @ingredient_1 = Ingredient.create!(name: "TVP", cost: 3)
      @ingredient_2 = Ingredient.create!(name: "Celery", cost: 1)
      @ingredient_3 = Ingredient.create!(name: "Carrots", cost: 2)
      @ingredient_4 = Ingredient.create!(name: "Parsnips", cost: 1)
      @ingredient_5 = Ingredient.create!(name: "Vital Wheat Gluten", cost: 3)
      @ingredient_6 = Ingredient.create!(name: "Onion", cost: 4)
      @ingredient_7 = Ingredient.create!(name: "Garlic", cost: 2)
   end
   describe "validations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :cost }
   end

   describe "relationships" do
      it { should have_many :recipe_ingredients }
      it { should have_many(:recipes).through(:recipe_ingredients) }
   end

   describe "class methods" do 
      it "order_by_name" do 
         expect(Ingredient.order_by_name).to eq([@ingredient_3, @ingredient_2, @ingredient_7, @ingredient_6, @ingredient_4, @ingredient_1, @ingredient_5])
      end
   end
end