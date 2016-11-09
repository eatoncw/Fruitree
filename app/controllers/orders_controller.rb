class OrdersController < ApplicationController

	before_action :authenticate_user!
	
	def index
		@orders = current_user.orders.all
	end

	def show
		if current_user.admin?
			@order = Order.find(params[:id])
		else
			@order = current_user.orders.find_by(id: params[:id])
		
			if @order == nil
				redirect_to root_path
				flash[:danger] = "You don't have access to that page"
			else
				@product = @order.product
			end
		end
	end
	
end
