class IngredientsController < ApplicationController
  before_action :all_ingredients, only: [:index]
  before_action :find_ingredient, only: [:show, :edit]

  def create

  end



  private

    def all_ingredients
      @ingredients = Ingredient.all
    end

    def find_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
      params.require(:ingredients).permit(:name, :category)
    end

end
