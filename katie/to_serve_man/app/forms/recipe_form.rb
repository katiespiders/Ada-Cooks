class RecipeForm

  def initialize(attributes)
    @recipe_attributes = {
      name: attributes[:name],
      author: attributes[:author]
    }
  end

  def submit
    recipe = Recipe.create(@recipe_attributes)

  end

end
