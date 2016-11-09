class Product < ApplicationRecord

	has_many :orders
	has_many :comments
	
	validates :name, presence: true, length: { minimum: 5 }
	validates :description, presence: true
	validates :price, presence: true

	has_attached_file :product_image, styles: { medium: "300x300>", thumb: "300x300#", large: "1200x1200>" }
	before_save :extract_dimensions
	serialize :dimensions
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

	def image?
		product_image_content_type =~ %r{^(image|(x-)?application)/(bmp|gif|jpeg|jpg|pjpeg|png|x-png)$}
	end

  def image_width
    dimensions.split('x').first.to_i
  end

  def image_height
    dimensions.split('x').last.to_i
  end

	private
		def extract_dimensions
			return unless image?
  		tempfile = product_image.queued_for_write[:original]
  		unless tempfile.nil?
    		geometry = Paperclip::Geometry.from_file(tempfile)
    		self.dimensions = [geometry.width.to_i, geometry.height.to_i].join('x')
  		end
		end
end

