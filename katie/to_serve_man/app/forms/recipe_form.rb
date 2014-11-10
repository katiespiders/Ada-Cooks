class RecipeForm
  attr_reader :attributes

  def initialize(attributes)
    @attributes = attributes
  end

  def submit
    recipe_attributes = {
      name: @attributes[:name],
      author: @attributes[:author],
      difficulty: @attributes[:difficulty],
      prep_time: @attributes[:prep_time],
      cook_time: @attributes[:cook_time],
      servings: @attributes[:servings],
      steps: @attributes[:steps]
    }

    recipe = Recipe.new(recipe_attributes)

    add_ingredients(recipe) if @attributes[:ingredients]

    recipe.save
    recipe.id

  end

  def add_ingredients(recipe)
    @attributes[:ingredients].each { id| recipe.add(Ingredient.find(id)) }
  end
  
end
