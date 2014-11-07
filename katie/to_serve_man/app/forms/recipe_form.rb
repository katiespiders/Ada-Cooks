class RecipeForm

  def initialize(attributes)
    @attributes = attributes
    @measurements = attributes[:measurements]
  end

  def submit
    recipe = Recipe.new

    @attributes[:ingredients].ingredients.each do |id|
      Measurement.new({@measurements.quantity, @measurements.unit, ingredient_id: id, recipe_id: recipe.id})
      # this needs ungarbling, because recipes are connected to ingredients via measurements and every ingredient in this iteration has a specific measurement attached to it, is this a triply nested hash or some shit???
    end
  end

end
