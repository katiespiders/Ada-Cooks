class RecipeForm
  attr_reader :attributes

  def initialize(attributes)
# puts "*"*80, attributes.inspect, "&"*80
    @attributes = {
      name: attributes[:name],
      author: attributes[:author],
      difficulty: attributes[:difficulty],
      prep_time: attributes[:prep_time],
      cook_time: attributes[:cook_time],
      servings: attributes[:servings],
      steps: attributes[:steps],
    }

    @ingredients = attributes[:ingredients]
  end

  def submit
    recipe = Recipe.new(@attributes)
    add_ingredients(recipe) if @ingredients

    recipe.save
    recipe.id
  end

  def modify(recipe)
    recipe.update(@attributes)
    recipe.ingredients.each { |ingredient| ingredient.destroy }
    add_ingredients(recipe) if @ingredients
  end


  def add_ingredients(recipe)
    @ingredients.each { |id| recipe.add(Ingredient.find(id)) }
  end

end
