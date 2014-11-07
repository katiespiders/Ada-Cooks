class RecipesController < ApplicationController
  before_action :all_recipes, only: [:index]
  before_action :find_recipe, only: [:show, :edit]

  def create
    @recipe_form = RecipeForm.new(params[:recipe_form])
    if @recipe_form.save
      redirect_to recipe_path(@recipe)
    end

  end

  def update
    @recipe.update(recipe_params)
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

    def recipe_params
      params.require(:recipes).permit(:name, :difficulty, :prep_time, :cook_time, :steps, :servings, :author)
    end
end
