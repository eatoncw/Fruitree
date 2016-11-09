require 'rails_helper'

RSpec.describe User, type: :model do

	it "should not validate users without an email address" do
		@user = FactoryGirl.build(:user, email: "not_address")
		expect(@user).to_not be_valid
	end
end
