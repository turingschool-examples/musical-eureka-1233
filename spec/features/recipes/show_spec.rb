require 'rails_helper'

RSpec.describe 'Recipe Show', type: :feature do
  let!(:chicken) {Ingredient.create!(name: "Chicken", cost: 10)}
  let!(:ravioli) {Ingredient.create!(name: "Ravioli", cost: 2)}
  let!(:cheese) {Ingredient.create!(name: "Parmesan", cost:5)}
  let!(:sauce) {Ingredient.create!(name: "Marinara", cost:3)}
  let!(:bread_crumbs) {Ingredient.create!(name: "Bread Crumbs", cost:1)}

  let!(:pasta_dish) {Recipe.create(name: "Pasta with Sauce", complexity: 2, genre: "Italian")}
  let!(:mac_n_cheese) {Recipe.create(name: "macaroni and cheese", complexity: 3, genre: "American")}
  let!(:chicken_fingers) {Recipe.create(name: "Chicken Fingers", complexity: 2, genre: "Kids Food")}

  let!(:chicken_pasta_dish) {RecipeIngredient.create!(ingredient_id: chicken.id, recipe_id: pasta_dish.id)}
  let!(:ravioli_pasta_dish) {RecipeIngredient.create!(ingredient_id: ravioli.id, recipe_id: pasta_dish.id)}
  let!(:sauce_pasta_dish) {RecipeIngredient.create!(ingredient_id: sauce.id, recipe_id: pasta_dish.id)}
  let!(:chicken_chicken_fingers) {RecipeIngredient.create!(ingredient_id: chicken.id, recipe_id: chicken_fingers.id)}
  let!(:bread_crumbs_chicken_fingers) {RecipeIngredient.create!(ingredient_id: bread_crumbs.id, recipe_id: chicken_fingers.id)}

  describe "visit '/recipes/:id" do
    it "US2 I see the recipe's name, complexity and genre, and I see a list of the names of the ingredients for the recipe." do
      visit "/recipes/#{pasta_dish.id}"

      within("h1")do
        expect(page).to have_content("Recipe Show Page")
      end

       within("#recipe_attributes-#{pasta_dish.id}") do
        expect(page).to have_content(pasta_dish.name)
        expect(page).to have_content(pasta_dish.complexity)
        expect(page).to have_content(pasta_dish.genre)

        expect(page).to_not have_content(mac_n_cheese.name)
        expect(page).to_not have_content(chicken_fingers.name)
        end

        within(".ingredients-#{pasta_dish.id}") do
          expect(page).to have_content(chicken.name)
          expect(page).to have_content(ravioli.name)
          expect(page).to have_content(sauce.name)
        end
      end

    describe "Total cost of Ingredients" do
      it "I see the total cost of all of the ingredients in the recipe." do
        visit "/recipes/#{pasta_dish.id}"
save_and_open_page

        within(".ingredients-#{pasta_dish.id}") do
          expect(page).to have_content("Total Cost: 15")
          end
        end
      end
    end
  end