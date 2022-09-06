class FoodsController < ApplicationController
    def index
        @user = User.find(params[:user_id])
        @foods = @user.foods
    end

    def show
        @foods = Food.find(params[:id])
        @user = User.find(params[:user_id])

    end

    def new
        @user = current_user
        @food = @user.foods.new
      end
    
      def create
        @user = current_user
        @food = @user.foods.create(food_params)
        if @food.save
          flash[:notice] = 'New food created successfully.'
        #   redirect_to user_post_path(@user, @post)
        else
          flash.now[:alert] = 'Food creation failed'
          render action: 'new'
        end
      end
    
    private
    def food_params
        params.require(:food).permit(:name, :measurement_unit, :price, :quantity )
      end
end