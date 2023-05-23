require "rails_helper"

RSpec.describe "Ingredients", type: :feature do
  describe "Ingredients Index" do
    it "displays a list of all ingredients with their name and cost" do
      ingredient1 = Ingredient.create(name: "Ground Beef", cost: 2)
      ingredient2 = Ingredient.create(name: "Salt", cost: 4)

      visit "/ingredients"

      expect(page).to have_content("#{ingredient1.name}: #{ingredient1.cost}")
      expect(page).to have_content("#{ingredient2.name}: #{ingredient2.cost}")
    end
  end
end
# RSpec.describe Ingredient, type: :feature do
#   before(:each) do
#     @ingredient1 = Ingredient.create!(name: "Ground Beef", cost: 2)
#     @ingredient2 = Ingredient.create!(name: "Salt", cost: 2)
#   end
    
#     describe "the ingredients index" do
#       it "shows ingredients and their associated cost" do

#         visit "/ingredients"

#         expect(page).to have_content("Name: #{@ingredient1.name}")
#         expect(page).to have_content("Cost: #{@ingredient1.cost}")
#         expect(page).to have_content("Name: #{@ingredient2.name}")
#         expect(page).to have_content("Cost: #{@ingredient2.cost}")
        
#       end
#     end
# end