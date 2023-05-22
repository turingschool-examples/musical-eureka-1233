require "rails_helper"

RSpec.describe "recipes show page", type: :feature do 
  before(:each) do 
    @recipe_1 = Recipe.create!(name: "Vegan Meatball Soup", complexity:4, genre: "Soups")
    @ingredient_1 = @recipe_1.ingredients.create!(name: "TVP", cost: 3)
    @ingredient_2 = @recipe_1.ingredients.create!(name: "Celery", cost: 1)
    @ingredient_3 = @recipe_1.ingredients.create!(name: "Carrots", cost: 2)
    @ingredient_4 = @recipe_1.ingredients.create!(name: "Parsnips", cost: 1)
    @ingredient_5 = @recipe_1.ingredients.create!(name: "Vital Wheat Gluten", cost: 3)
    @ingredient_6 = @recipe_1.ingredients.create!(name: "Onion", cost: 4)
    @ingredient_7 = @recipe_1.ingredients.create!(name: "Garlic", cost: 2)
    @ingredient_8 = @recipe_1.ingredients.create!(name: "Fennel", cost: 2)
    @ingredient_9 = @recipe_1.ingredients.create!(name: "Liquid Smoke", cost: 5)
  end

  it "displays the recipe's name, complexity, and genre with a list of names of ingredients for the recipe" do
    visit "/recipes/#{@recipe_1.id}"
    
    expect(page).to have_content("Recipe Name: #{@recipe_1.name}")
    expect(page).to have_content("Recipe Complexity: #{@recipe_1.complexity}")
    expect(page).to have_content("Genre: #{@recipe_1.genre}")
    expect(page).to have_content("Ingredients List:")
    expect(page).to have_content("#{@ingredient_1.name}")
    expect(page).to have_content("#{@ingredient_2.name}")
    expect(page).to have_content("#{@ingredient_3.name}")
    expect(page).to have_content("#{@ingredient_4.name}")
    expect(page).to have_content("#{@ingredient_5.name}")
    expect(page).to have_content("#{@ingredient_6.name}")
    expect(page).to have_content("#{@ingredient_7.name}")
    expect(page).to have_content("#{@ingredient_8.name}")
    expect(page).to have_content("#{@ingredient_9.name}")
    expect(page).to_not have_content("#{@ingredient_9.cost}")
  end
  
  it "displays total cost of all ingredients in the recipe" do 
    visit "/recipes/#{@recipe_1.id}"
save_and_open_page

    expect(page).to have_content("Total cost for all ingredients: #{@recipe_1.recipe_cost}")
  end
end