FactoryGirl.define do
	sequence(:email) { |n| "user#{n}@sample.com"}
	
	factory :user do
		email
		password "designtbl123"
		first_name "Gary"
		last_name "Garyson"
		admin false
	end
end
