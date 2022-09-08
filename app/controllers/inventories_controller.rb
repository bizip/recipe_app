class InventoriesController < ApplicationController
	def index
		@user = current_user
		@inventories = @user.inventories
	end

	def show
		@user = current_user
		@inventory = @user.inventories.find(params[:id])
		@foods = @inventory.inventory_foods.includes(:food)
	end

	def new
		@inventory = Inventory.new
	end

	def create
		@inventory = Inventory.create(inventory_params)
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
		@inventory = Inventory.find_by(id: params[:id])

		if @inventory.destroy
			flash[:notice] = 'Inventory deleted successfully!'
		else
			flash[:alert] = 'Something unexpected happened, inventory could not be deleted.'
		end
		redirect_to user_inventories_path
	end

	private

	def inventory_params
		params.require(:inventory).permit(:name)
	end
end
