FactoryGirl.define do
  factory :user do
    sequence(:first_name){ |n| "Bob #{n}" }
  end
end
