class RecipesController < ApplicationController
  before_action :all_recipes, only: [:index]
  before_action :find_recipe, only: [:show, :edit]


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
    @recipe.update(form_params)
    if @medium.save
      redirect_to recipe_path(@medium.id)
    else
      render :edit
    end
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
end
