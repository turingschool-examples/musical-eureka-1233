require "rails_helper"

RSpec.describe Recipe, type: :model do
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
   
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe "relationships" do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe "Total cost of Ingredients" do
    it "calculates the total cost of the recipes ingredients" do

      expect(pasta_dish.total_cost).to eq(15)
      expect(chicken_fingers.total_cost).to eq(11)
      expect(mac_n_cheese.total_cost).to eq(0)
    end
  end
end