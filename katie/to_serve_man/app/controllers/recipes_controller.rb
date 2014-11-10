class RecipesController < ApplicationController
  before_action :all_recipes, only: [:index]
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]


  def create
    # raise params.inspect
    @recipe_form = RecipeForm.new(form_params)

    if id = @recipe_form.submit
      redirect_to recipe_path(id)
    else
      render :new
    end
  end

  def update
puts "$"*80, form_params, "#"*80, form_ingredients
    @recipe_form = RecipeForm.new(form_params)
raise
    @recipe_form.modify(@recipe)
    if @recipe.save
      redirect_to recipe_path(@recipe.id)
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to root_path
  end

  private

    def all_recipes
      @recipes = Recipe.all
    end

    def find_recipe
      @recipe = Recipe.find(params[:id])
    end

    def form_params
      params.require(:recipe_forms).permit(:name,
      :author,
      :prep_time,
      :cook_time,
      :difficulty,
      :servings,
      :steps,
      :ingredients)
    end

    def form_ingredients
      params.require(:recipe_forms).permit(:ingredients)
    end
end
