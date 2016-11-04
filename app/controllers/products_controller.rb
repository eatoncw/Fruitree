class ProductsController < ApplicationController

	before_action :set_product, except: [:index, :new, :create]
	before_action :authenticate_user!, except: [:index, :show]
	load_and_authorize_resource
	add_breadcrumb "Fruitree", :root_path
	add_breadcrumb "Products", :products_path

	def index
		@products = Product.all

	end

	def show
		add_breadcrumb @product.breadcrumb_name, @product
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		
		respond_to do |format|
			if @product.save
				format.js {}
				format.json { render :show, status: :created, location: @product }
				flash.now[:success] = "#{@product.name} has been successfully added"
			else
				format.js { render :new }
				format.json { render json: @product.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit
	end

	def update
		@product.update(product_params)

		respond_to do |format|
			if @product.update(product_params)
				format.js {}
				format.json { render :show, status: :created, location: @product }
				flash.now[:success] = "#{@product.name} has been successfully updated"
			else
				format.js { render :edit }
				format.json { render json: @product.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@product.destroy
	end

	private
		
		def set_product
			@product = Product.find(params[:id])
		end

		def product_params
			params.require(:product).permit(:name, :description, :price, :img_url)
		end

end
