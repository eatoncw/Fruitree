require 'rails_helper'

RSpec.describe Comment, type: :model do
	
	before do
		@product = FactoryGirl.create(:product)
		@user = FactoryGirl.create(:user)
		
		@comment = Comment.create!(rating: 2, body: "meh", user_id: @user.id, product_id: @product.id)
	end

	it "comment is not valid, no rating" do
		expect(Comment.new(body: "ABCDEF")).not_to be_valid
	end

	it "comment user" do
		expect(@comment.user = @user).to be_valid
	end

end
