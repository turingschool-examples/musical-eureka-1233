require 'rails_helper'

RSpec.describe "ingredients index" do
  before(:each) do
    @lt = Recipe.create!(name: "LT", complexity: 2, genre: "Veggie Sandwich")
    @ham_sandwich = Recipe.create!(name: "Ham Sandwich", genre: "Meat Sandwich")
    @bacon_sandwich = Recipe.create!(name: "Bacon Sandwich", genre: "Meat Sandwich")
  end

  it 'show recipe with name, complexity, and genre' do
    visit "/recipes/#{@lt.id}"

    expect(page).to have_content(@lt.name)
    expect(page).to have_content(@lt.complexity)
    expect(page).to have_content(@lt.genre)

    visit "/recipes/#{@ham_sandwich.id}"

    expect(page).to have_content(@ham_sandwich.name)
    expect(page).to have_content(@ham_sandwich.complexity)
    expect(page).to have_content(@ham_sandwich.genre)

    visit "/recipes/#{@bacon_sandwich.id}"

    expect(page).to have_content(@bacon_sandwich.name)
    expect(page).to have_content(@bacon_sandwich.complexity)
    expect(page).to have_content(@bacon_sandwich.genre)
  end

  xit 'show a list of the ingredients for the recipe' do
    visit "/recipes/#{@lt.id}"


    visit "/recipes/#{@ham_sandwich.id}"


    visit "/recipes/#{@bacon_sandwich.id}"

  end