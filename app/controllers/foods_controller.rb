class FoodsController < ApplicationController
  load_and_authorize_resource
  before_action :set_food, only: [:show, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  
  def index
    @foods = Food.all
  end

  def show;  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.create(food_params)
    if @food.save
      flash[:notice] = 'New food created successfully.'
      redirect_to @food
    else
      flash.now[:alert] = 'Food creation failed'
      render :new
    end
  end

  def destroy
    @food.destroy
    redirect_to foods_path(@food), notice: "Successfully deleted the food #{@food.name}."
  end

  private

  def set_food 
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
