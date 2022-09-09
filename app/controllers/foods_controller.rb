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
    @food = Food.new(new_food_params)
    @food.user_id = current_user.id
    if @food.save
      redirect_to foods_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path, notice: "#{@food.name} Food record successfully."
  end

  private

  def new_food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :user_id)
  end
end
