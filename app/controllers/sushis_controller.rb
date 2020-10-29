class SushisController < ApplicationController
    before_action :set_sushi, only: [:show, :edit, :update, :destroy]

    def index
      @sushis = Sushi.all
    end

    def show
      if !@sushi
        redirect_to sushis_path
      end
    end

    def new
      @sushi = Sushi.new
      5.times { @sushi.ingredients.build }
    end

    def create
      binding.pry
      @sushi = Sushi.new(sushi_params)
      binding.pry
      if @sushi.save
        redirect_to sushi_path(@sushi)
      else
        render :new
        5.times { @sushi.ingredients.build }
      end
    end

    def edit
      if !@sushi
        redirect_to sushis_path
      end
    end

    def update
      if @sushi
        @sushi.update(sushi_params)
        if @sushi.errors.any?
          render "edit"
        else
          redirect_to @sushi
        end
      else
        render "edit"
      end
    end

    def destroy
      @sushi.destroy
      redirect_to sushis_path
    end

    private

    def set_sushi
      @sushi = Sushi.find_by_id(params[:id])
    end

    def sushi_params
      params.require(:sushi).permit(:name, ingredients_attributes: [:id, :name, :calories, :serving_size])
    end
end
