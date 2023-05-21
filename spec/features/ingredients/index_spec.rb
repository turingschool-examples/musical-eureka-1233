require "rails_helper"
RSpec.describe 'the ingredients index' do
#   User Story 1 - Ingredients Index
  garlic = Ingredient.create!(name: "garlic", cost: 1)
  turkey = Ingredient.create!(name: "ground turkey", cost: 6)
  pasta = Ingredient.create!(name: "penne", cost: 3)
# As a visitor,
# When I visit '/ingredients'
# I see a list of all the ingredients including their name and cost
# (e.g. "Ground Beef: 2"
#      "Salt: 4")
  it 'lists all ingredients and their attributes' do
    visit '/ingredients'
    save_and_open_page
    expect(page).to have_content(garlic.name)
    expect(page).to have_content(garlic.cost)
    expect(page).to have_content(turkey.name)
    expect(page).to have_content(turkey.cost)
    expect(page).to have_content(pasta.name)
    expect(page).to have_content(pasta.cost)
  end

end