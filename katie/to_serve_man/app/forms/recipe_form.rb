class RecipeForm

  def initialize(attributes)
    @attributes = attributes

  end

  def submit
    recipe_attributes = {
      name: @attributes[:name],
      author: @attributes[:author]
    }
    recipe = Recipe.create(recipe_attributes)

    measurement_attributes = {
      quantity: @attributes[:quantity],
      unit: @attributes[:unit],
      ingredient_id: @attributes[:ingredient_id],
      recipe_id: recipe.id
    }

    Measurement.create(measurement_attributes)

    return recipe.id # how kludgy is this?

  end

end
