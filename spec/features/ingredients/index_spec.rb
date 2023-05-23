require "rails_helper"

RSpec.describe "/ingredients", type: :feature do
  before(:each) do
    @ing1 = Ingredient.create!(name: "Lemon", cost: 2)
    @ing2 = Ingredient.create!(name: "Asparagus", cost: 1)
    @ing3 = Ingredient.create!(name: "Salmon", cost: 10)
  end

  describe "ingredients index" do
    it "displays all of the ingredients" do
      visit "/ingredients"

      expect(page).to have_content("#{@ing1.name}")
      expect(page).to have_content("$#{@ing1.cost}")
      expect(page).to have_content("#{@ing2.name}")
      expect(page).to have_content("$#{@ing2.cost}")
      expect(page).to have_content("#{@ing3.name}")
      expect(page).to have_content("$#{@ing3.cost}")
    end

    it "displays all of the ingredients sorted alphabetically" do
      visit "/ingredients"

      expect("#{@ing2.name}").to appear_before("#{@ing1.name}")
      expect("#{@ing1.name}").to appear_before("#{@ing3.name}")
    end
  end
end
