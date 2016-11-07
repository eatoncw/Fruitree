class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :product

  validates :body, presence: true
  validates :rating, numericality: { less_than_or_equal_to: 5, only_integer: true }

  scope :rating_desc, -> { order(rating: :desc) }

end
