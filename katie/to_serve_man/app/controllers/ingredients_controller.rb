class IngredientsController < ApplicationController
  before_action :all_ingredients, only: [:index]
  before_action :find_ingredient, only: [:show, :edit, :update]

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient.id)
    else
      render :new
    end
  end

  def update
    if @ingredient.update(ingredient_params)
    #   redirect_to ingredient_path(@ingredient.id)
    # else
    #   render :edit
    end
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
