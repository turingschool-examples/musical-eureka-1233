require "rails_helper"

RSpec.describe 'Recipe Show Page' do
  let!(:risotto) { Recipe.create!(name: "Truffle Risotto", complexity: 8, genre: "Italian") }
  let!(:ing_1) { Ingredient.create!(name: "Arborio Rice", cost: 10) }
  let!(:ing_2) { Ingredient.create!(name: "Pinot Grigio", cost: 7) }
  let!(:ing_3) { Ingredient.create!(name: "Soy Cream Cuisine", cost: 2) }
  let!(:ing_4) { Ingredient.create!(name: "Truffle Mushroom", cost: 15) }
  let!(:ing_5) { Ingredient.create!(name: "Asparagus", cost: 2) }
  let!(:ing_6) { Ingredient.create!(name: "EVOO", cost: 12) }

  it 'should display a recipes attributes' do
    visit recipe_path(risotto.id)
    
    expect(page).to have_content(risotto.name)
    expect(page).to have_content(risotto.complexity)
    expect(page).to have_content(risotto.genre)
  end

  it 'should display ingredients in this recipe' do
    risotto.ingredients << [ing_1, ing_2, ing_3, ing_4, ing_5, ing_6]

    visit recipe_path(risotto.id)

    expect(page).to have_content(ing_1.name)
    expect(page).to have_content(ing_2.name)
    expect(page).to have_content(ing_3.name)
    expect(page).to have_content(ing_4.name)
    expect(page).to have_content(ing_5.name)
    expect(page).to have_content(ing_6.name)
  end

  it 'should display the total cost of the recipe' do
    risotto.ingredients << [ing_1, ing_2, ing_3, ing_4, ing_5, ing_6]

    visit recipe_path(risotto)
    
    expect(page).to have_content("Total Cost: $48.00")
  end

  it 'should display a form to add an ingredient to a recipe' do
    ing_7 = Ingredient.create!(name: "Chanterelles", cost: 12)
    visit recipe_path(risotto.id)
    save_and_open_page
    expect(page).to have_button("Add Ingredient")

    fill_in(:ingredient, with: "#{ing_7.id}")
    click_button("Add Ingredient")

    expect(current_path).to eq(recipe_path(risotto))
    expect(page).to have_content(ing_7.name)
  end
end

# Extension 2 - Add an Ingredient to a Recipe

# As a visitor
# When I visit '/recipes/:id'
# Then I see a form to add an ingredient to this recipe.
# When I fill in a field with an existing ingredient's ID,
# And I click submit,
# Then I am redirrected to the recipe's show page,
# And I see the new ingredient listed for this recipe.