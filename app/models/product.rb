class Product < ApplicationRecord

	has_many :orders
	has_many :comments
	
	validates :name, presence: true, length: { minimum: 5 }
	validates :img_url, presence: true
	validates :description, presence: true
	validates :price, presence: true

	def breadcrumb_name
		name.truncate(30)
	end

	def highest_rated_comment
		comments.rating_desc.first
	end

	def lowest_rated_comment
		comments.rating_desc.last
	end

	def comment_order
		comments.order(created_at: :desc)
	end
end

