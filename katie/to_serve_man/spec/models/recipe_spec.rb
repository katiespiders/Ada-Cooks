require "rails_helper"

describe "Recipe model" do
  let(:gazpacho){Recipe.create(name:"Gazpacho", author:"Lisa", prep_time:60, cook_time:180, steps: "You don't win friends with salad", servings: 8)}

  specify "recipe created with no ingredients" do
    expect(gazpacho.ingredients.count).to eq 0
  end

  specify "can add ingredients to recipe" do
    gazpacho.add(Ingredient.create(name:"Tomato", category:"Produce"))
    expect(gazpacho.ingredients.count).to eq 1
  end

  specify "returns hash of ingredients keyed to categories" do
    gazpacho.add(Ingredient.create(name:"Tomato", category:"Produce"))
    gazpacho.add(Ingredient.create(name:"Vinegar", category:"Other"))
    categories = {"Produce"=>["Tomato"], "Other"=>["Vinegar"]}
    expect(gazpacho.categories).to eq categories
  end

end
