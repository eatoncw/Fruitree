class PaymentsController < ApplicationController

	before_action :authenticate_user!

	def create
		@product = Product.find(params[:product_id])
		@user = current_user
		token = params[:stripeToken]

		begin
			charge = Stripe::Charge.create(
				:amount => @product.price_in_cents,
				:currency => "usd",
				:source => token,
				:description => params[:stripeEmail],
				:receipt_email => params[:stripeEmail]
			)

			if charge.paid
				
				foreign_parameters = {:user_id => @user.id, :product_id => @product.id, :total => @product.price}
				parameters = ActionController::Parameters.new(foreign_parameters)
				@order = Order.create(parameters.permit(:product_id, :user_id, :total))
			end

		rescue Stripe::CardError => e
			body = e.json_body
			err = body[:error]
			flash[:error] = "Unfortunately there was an error processing your payment: #{err[:message]}"
		end

		redirect_to @order, notice: "Product was successfully purchased"
	end

end
