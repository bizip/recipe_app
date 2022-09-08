class InventoryFoodsController < ApplicationController
  def destroy
  	@inventory_food = InventoryFood.find_by(id: params[:food_id])

		if @inventory_food.destroy
			flash[:notice] = 'Inventory food deleted successfully!!'
		else
			flash[:alert] = 'Something unexpected happened, inventory could not be deleted.'
		end
		redirect_to inventory_path(params[:id])
	end

	def new
		@inventory = current_user.inventories.find(params[:id])
		@inventory_food = InventoryFood.new
	end
end
