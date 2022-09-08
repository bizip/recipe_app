class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show
    @foods = Food.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.create(food_params)
    if @food.save
      flash[:notice] = 'New food created successfully.'
      redirect_to foods_path(@user, @food)
    else
      flash.now[:alert] = 'Food creation failed'
      render action: 'new'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path, notice: "Successfully deleted the food #{@food.name}."
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
