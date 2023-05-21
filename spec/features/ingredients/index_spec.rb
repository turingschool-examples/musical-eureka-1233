require 'rails_helper' 

RSpec.describe 'Ingredients index' do  
  describe 'index testing' do 
    before :each do 
      @brisket = Ingredient.create!(name: "Bison Brisket", cost: 25)
      @potatoes = Ingredient.create!(name: "Potatoes", cost: 4)
    end

    it 'lists all the ingredients including name and cost' do 
      visit '/ingredients'
      expect(page).to have_content("#{@brisket.name}: #{@brisket.cost}")
      expect(page).to have_content("#{@potatoes.name}: #{@potatoes.cost}")
    end

    it 'sorts ingredients alphabetically' do 
      fatback = Ingredient.create!(name: 'fatback', cost: 8)
      pintos = Ingredient.create!(name: 'pintos', cost: 5)
      tomatoes = Ingredient.create!(name: 'tomatoes', cost: 10)
      visit '/ingredients' 

      expect(@brisket).to appear_before(@potatoes)
      expect(@potatoes).to appear_before(fatback)
      expect(fatback).to appear_before(pintos)
      expect(pintos).to appear_before(tomatoes)

      expect(page).to have_link('Sort Ingredients Alphabetically')
      click_on 'Sort Ingredients Alphabetically'

      expect(@brisket).to appear_before(fatback)
      expect(pintos).to appear_before(@ingredient_2)
      expect(@ingredient_2).to appear_before(tomatoes)
      expect(tomatoes).to_not appear_before(@ingredient_2)
    end
  end
end