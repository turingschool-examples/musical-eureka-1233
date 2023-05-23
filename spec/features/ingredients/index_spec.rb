require "rails_helper"

RSpec.describe 'Ingredients Index Page' do
  let!(:ing_1) { Ingredient.create!(name: "Arborio Rice", cost: 10) }
  let!(:ing_2) { Ingredient.create!(name: "Pinot Grigio", cost: 7) }
  let!(:ing_3) { Ingredient.create!(name: "Soy Cream Cuisine", cost: 2) }
  let!(:ing_4) { Ingredient.create!(name: "Truffle Mushroom", cost: 15) }
  let!(:ing_5) { Ingredient.create!(name: "Asparagus", cost: 2) }
  let!(:ing_6) { Ingredient.create!(name: "EVOO", cost: 12) }

  it 'should display a list of ingredients with names and cost' do
    visit ingredients_path

    expect(page).to have_content(ing_1.name)
    expect(page).to have_content(ing_1.cost)
    expect(page).to have_content(ing_2.name)
    expect(page).to have_content(ing_2.cost)
    expect(page).to have_content(ing_3.name)
    expect(page).to have_content(ing_3.cost)
  end

  it 'should display ingredients in alphabetical order' do
    visit ingredients_path
    
    expect(ing_1.name).to appear_before(ing_5.name)
    expect(ing_5.name).to appear_before(ing_6.name)
    expect(ing_6.name).to appear_before(ing_2.name)
    expect(ing_2.name).to appear_before(ing_3.name)
    expect(ing_3.name).to appear_before(ing_4.name)
  end
end
#save_and_open_page
