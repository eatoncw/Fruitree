class CommentsController < ApplicationController

	before_action :set_comment, except: [:create]

	def create
		@product = Product.find(params[:product_id])
		
		@comment = @product.comments.new(comment_params)
		@comment.user = current_user
		@comment.save

	end

	def destroy
		@product = Product.find(params[:product_id])

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

	def edit
	end

	def update
	end

	def flag
		@product = Product.find(params[:product_id])
		flagged = params[:flag]
		@comment.update(flag: flagged)
		
		@user = current_user
		UserMailer.flag(@user, @comment).deliver_later
	end

	private

		def set_project
		end

		def set_comment
			@comment = Comment.find(params[:id])
		end

		def comment_params
			params.require(:comment).permit(:user_id, :body, :rating, :flag)
		end
end
