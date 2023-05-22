require 'rails_helper'

RSpec.describe "/ingrediants" do
  before :each do
    @milk = Ingredient.create!(name: "Milk", cost: 2)
    @flour = Ingredient.create!(name: "Flour", cost: 1)
  end
  describe "As a visitor, when I visit the ingrediants index page" do
    it 'Displays a list of all the ingrediants including their name and cost' do
      visit "/ingredients"
      expect(page).to have_content(@milk.name)
      expect(page).to have_content(@milk.cost)
      expect(page).to have_content(@flour.name)
      expect(page).to have_content(@flour.cost)
    end
    it 'displays the list of ingredients alphabetically' do
      visit "/ingredients"
      save_and_open_page
      expect(@flour.name).to appear_before(@milk.name)
    end
  end
end