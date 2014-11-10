require 'rails_helper'

describe "RecipeForm class" do
  let(:attributes){ {
    name: "Gazpacho",
    author: "Lisa",
    difficulty: 3,
    prep_time: 45,
    cook_time: 180,
    servings: 8,
    steps: "You don't win friends with salad",
    }}

  let(:form){ RecipeForm.new(attributes)}

  specify "initializes with attributes" do
    expect(form.attributes[:name]).to eq "Gazpacho"
  end

  specify "submit returns a recipe id" do
    expect(form.submit.class).to be(Fixnum)
  end

  specify "submit creates a Recipe object" do
    form.submit
    expect(Recipe.first.class).to be(Recipe)
  end

  specify "can modify attributes of Recipe object" do
    form.submit
    gazpacho = Recipe.first
    attributes[:cook_time] = 240
    form = RecipeForm.new(attributes)
    form.modify(gazpacho)
    expect(gazpacho.cook_time).to eq 240
  end

  specify "can modify ingredients associated with Recipe object" do
    form.submit
    gazpacho = Recipe.first
    Ingredient.create(name:"Tomato")
    attributes[:ingredients] = [Ingredient.first]
    edit_form = RecipeForm.new(attributes)
    edit_form.modify(gazpacho)
    expect(gazpacho.ingredients.first).to eq Ingredient.first
  end

end
