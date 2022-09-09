class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show; end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(new_food_params)
    if @food.save
      redirect_to foods_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @food.destroy
    redirect_to foods_path, notice: "#{@food.name} Food record successfully."
  end

  private

  def new_food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
