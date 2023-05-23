require 'rails_helper'

RSpec.describe "ingredients index" do
  before(:each) do
    @tomatoe = Ingredient.create!(name: "tomatoe", cost: 2)
    @lettuce = Ingredient.create!(name: "lettuce", cost: 1)
    @bread = Ingredient.create!(name: "bread", cost: 5)
    @bacon = Ingredient.create!(name: "bacon", cost: 10)
    @ham = Ingredient.create!(name: "ham", cost: 12)
  end

  it 'lists all ingredients with their name and cost' do
    visit "/ingredients"

    expect(page).to have_content("#{@tomatoe.name} : #{@tomatoe.cost}")
    expect(page).to have_content("#{@lettuce.name} : #{@lettuce.cost}")
    expect(page).to have_content("#{@bread.name} : #{@bread.cost}")
    expect(page).to have_content("#{@bacon.name} : #{@bacon.cost}")
    expect(page).to have_content("#{@ham.name} : #{@ham.cost}")
  end
end