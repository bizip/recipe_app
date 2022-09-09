class InventoriesController < ApplicationController
  # load_and_authorize_resource
  before_action :set_inventory, only: [:show, :destroy]
  before_action :authenticate_user!, only: %i[new create destroy]
  def index
    @inventories = Inventory.all
  end

  def show
    @foods = @inventory.inventory_foods.includes(:food)
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(new_inventory_params)
    @inventory.user = current_user

    if @inventory.save
      flash[:notice] = 'Inventory created successfully!'
      redirect_to user_inventories_path
    else
      flash.now[:alert] = 'Something unexpected happened, inventory could not be created.'
      render :new
    end
  end

  def destroy
    if @inventory.destroy
      flash[:notice] = 'Inventory deleted successfully!'
    else
      flash[:alert] = 'Something unexpected happened, inventory could not be deleted.'
    end
    redirect_to user_inventories_path
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  def new_inventory_params
    params.require(:inventory).permit(:name)
  end
end
