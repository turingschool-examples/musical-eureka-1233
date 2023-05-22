require "rails_helper" 

RSpec.describe "ingredients index page", type: :feature do 
  before(:each) do 
    @ingredient_1 = Ingredient.create!(name: "TVP", cost: 3)
    @ingredient_2 = Ingredient.create!(name: "Celery", cost: 1)
    @ingredient_3 = Ingredient.create!(name: "Carrots", cost: 2)
  end

  it "displays a list of all ingredients in cluding their name and cost" do 
    visit ingredients_path

    expect(page).to have_content("All Ingredients")
    expect(page).to have_content("Name: #{@ingredient_1.name}")
    expect(page).to have_content("Name: #{@ingredient_2.name}")
    expect(page).to have_content("Name: #{@ingredient_3.name}")
    expect(page).to have_content("Cost: #{@ingredient_3.cost}")
    expect(page).to have_content("Cost: #{@ingredient_2.cost}")
    expect(page).to have_content("Cost: #{@ingredient_1.cost}")
  end

  it "displays ingredients listed in alphabetical order" do 
    visit ingredients_path 
    
    expect("Carrots").to appear_before("Celery")
    expect("Celery").to appear_before("TVP")
    expect("TVP").to_not appear_before("Carrots")
  end
end