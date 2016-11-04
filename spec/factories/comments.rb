FactoryGirl.define do
  factory :comment do
    user nil
    body "MyText"
    rating 1
    product nil
  end
end
