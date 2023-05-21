require "rails_helper"
RSpec.describe 'the ingredients index' do
#   User Story 1 - Ingredients Index

# As a visitor,
# When I visit '/ingredients'
# I see a list of all the ingredients including their name and cost
# (e.g. "Ground Beef: 2"
#      "Salt: 4")
  it 'lists all ingredients and their attributes' do
    visit '/ingredients'

    expect(page).to have_content()
  end



end