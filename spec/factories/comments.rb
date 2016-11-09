FactoryGirl.define do
	factory :comment do
		user
		body "MyText"
		rating 1
	end
end
