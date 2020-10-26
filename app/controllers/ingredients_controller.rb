class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show]

  def index
    if params[:sushi_id]
      set_sushi
      @ingredients = @sushi.ingredients
    else
      @ingredients = Ingredient.all
    end
  end

  def show
    if params[:sushi_id]
      set_sushi
    end
  end

  def new
    if params[:sushi_id]
      set_sushi
      @ingredient = @sushi.ingredients.build
    else
      @ingredient = Ingredient.new
    end
  end

  def create
    if params[:sushi_id]
      set_sushi
      @ingredient = @sushi.ingredients.build(ingredient_params)
    else
      @ingredient = Ingredient.new(ingredient_params)
    end
    if @ingredient.save
      if @sushi
        redirect_to sushi_ingredient_path(@sushi, @ingredient)
      else
        redirect_to @ingredient
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_sushi
    @sushi = Sushi.find_by_id(params[:sushi_id])
  end

  def set_ingredient
    @ingredient = Ingredient.find_by_id(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :calories, :serving_size, :sushi_id)
  end

end
