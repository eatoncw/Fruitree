class Product < ApplicationRecord

	has_many :orders
	
	validates :name, presence: true, length: { minimum: 5 }
	validates :img_url, presence: true
	validates :description, presence: true
	validates :price, presence: true

	def breadcrumb_name
		name.truncate(30)
	end
end

