require 'rails_helper' 

RSpec.describe 'Ingredients index' do 
  before :each do 
    @ingredient_1 = Ingredient.create!(name: "Bison Brisket", cost: 25)
    @ingredient_2 = Ingredient.create!(name: "Potatoes", cost: 4)
  end
  describe 'index testing' do 
    it 'lists all the ingredients including name and cost' do 
      visit '/ingredients' do 
      expect(page).to have_content("#{@ingredient_1.name}: #{ingredient_1.cost}")
      expect(page).to have_content("#{@ingredient_2.name}: #{ingredient_2.cost}")
      end
    end
  end
end