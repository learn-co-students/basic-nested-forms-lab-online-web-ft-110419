class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    2.times do |t|
      @recipe.ingredients.build
    end
  end

  def create
    @recipe = Recipe.new(params.require(:recipe).permit(:title, :ingredients_attributes => [:name, :quantity]))
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :'recipes/new'
    end
  end


end
