class RecipeForm

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

    if @attributes[:new_ingredients]
      @attributes[:new_ingredients].split(', ').each do |name|
        recipe.ingredients << Ingredient.create(name: name.titleize)
      end
    end

    if @attributes[:ingredients]
      @attributes[:ingredients].each do |id|
        recipe.ingredients << Ingredient.find(id)
      end
    end

    recipe.save
    recipe.id

  end

end
