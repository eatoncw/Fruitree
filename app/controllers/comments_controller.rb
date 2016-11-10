class CommentsController < ApplicationController

	before_action :authenticate_user!
  before_action :set_comment, except: [:create]
  before_action :set_product

	def create
		@comment = @product.comments.new(comment_params)
		
		if @comment.rating == nil || @comment.body.length < 1
			render :no_comment
		else
			@comment.user = current_user
			@comment.save
			ActionCable.server.broadcast 'product_channel', comment: @comment, average_rating: @comment.product.average_rating
		end

	end

	def destroy
		
		if current_user.admin?
			@comment.destroy
		else
			if @comment.user_id = current_user.id
				@comment.destroy
			else
				flash.now[:danger] = "You are not authorized to delete this comment"
			end
		end
	end

	def flag
		
		flagged = params[:flag]
		@comment.update(flag: flagged)
		
		@user = current_user
		UserMailer.flag(@user, @comment).deliver_later
	end

	private

		def set_product
      @product = Product.find(params[:product_id])
		end

		def set_comment
			@comment = Comment.find(params[:id])
		end

		def comment_params
			params.require(:comment).permit(:user_id, :body, :rating, :flag)
		end
end
