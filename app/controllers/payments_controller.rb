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
				total = @product.price
				@order = Order.new(order_params)
        @order.user_id = current_user.id
        @order.product_id = @product.id
        @order.total = total
        @order.save
			end
		rescue Stripe::CardError => e
			body = e.json_body
			err = body[:error]
			flash[:error] = "Unfortunately there was an error processing your payment: #{err[:message]}"
		end

		redirect_to @order, notice: "Product was successfully purchased"
	end

  private
    def order_params
      params.require(:order).permit(:user_id, :product_id, :total)
end
