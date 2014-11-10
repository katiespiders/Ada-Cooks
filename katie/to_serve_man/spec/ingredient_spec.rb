require 'rails_helper'

describe "Ingredient model" do
  specify "returns all ingredients in a given category" do
    t = Ingredient.create(name:"Tequila", category:"Other")
    v = Ingredient.create(name:"Vodka", category:"Other")
    n = Ingredient.create(name:"Non-alcoholic grapes", category:"Produce")
    liquor = Ingredient.all_in("Other")

    expect(liquor).to include v
    expect(liquor).to include t
    expect(liquor).not_to include n
  end
end
