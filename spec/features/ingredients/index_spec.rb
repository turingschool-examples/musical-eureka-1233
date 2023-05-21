require 'rails_helper' 

RSpec.describe 'Ingredients index' do  
  describe 'index testing' do 
    before :each do 
      @brisket = Ingredient.create!(name: "bison brisket", cost: 25)
      @potatoes = Ingredient.create!(name: "potatoes", cost: 4)
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

      expect(@brisket.name).to appear_before(@potatoes.name)
      expect(@potatoes.name).to appear_before(fatback.name)
      expect(fatback.name).to appear_before(pintos.name)
      expect(pintos.name).to appear_before(tomatoes.name)

      expect(page).to have_link('Sort Ingredients Alphabetically')
      click_on 'Sort Ingredients Alphabetically'

      expect(@brisket.name).to appear_before(fatback.name)
      expect(pintos.name).to appear_before(@potatoes.name)
      expect(@potatoes.name).to appear_before(tomatoes.name)
      expect(tomatoes.name).to_not appear_before(@potatoes.name)
    end
  end
end