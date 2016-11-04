class CommentsController < ApplicationController

	before_action :set_comment, except: [:create]

	def create
		@product = Product.find(params[:product_id])
		
		@comment = @product.comments.new(comment_params)
		@comment.user = current_user
		@comment.save

	end

	def destroy
	end

	def edit
	end

	def update
	end

	def flag
	end

	private

		def set_project
		end

		def set_comment
			@comment = Comment.find(params[:id])
		end

		def comment_params
			params.require(:comment).permit(:user_id, :body, :rating)
		end
end
