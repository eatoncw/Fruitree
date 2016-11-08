class Product < ApplicationRecord

	has_many :orders
	has_many :comments
	
	validates :name, presence: true, length: { minimum: 5 }
	validates :description, presence: true
	validates :price, presence: true

	has_attached_file :product_image, styles: { medium: "300x300>", thumb: "100x100#", large: "1200x1200>" }
	validates_attachment_content_type :product_image, content_type: /\Aimage\/.*\z/


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

	def average_rating
		comments.average(:rating).to_f
	end
end

