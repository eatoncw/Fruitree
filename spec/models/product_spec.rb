require 'rails_helper'

RSpec.describe Product, type: :model do

	before do
		@product = FactoryGirl.create(:product)
		@user = FactoryGirl.create(:user)
		@product.comments.create!(rating: 1, user: @user, body:"meh!")
		@product.comments.create!(rating: 3, user: @user, body:"ok!")
		@product.comments.create!(rating: 5, user: @user, body:"great!")
	end

	it "returns the average of all the comments" do
		expect(@product.average_rating).to eq 3
	end

	it "product is not valid, to few characters" do
		expect(Product.new(name: "ABC")).not_to be_valid
	end


end
