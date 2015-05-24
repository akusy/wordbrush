FactoryGirl.define do
  factory :user do
    activation_code { SecureRandom.hex }
    sequence(:username) { |n| "user#{n}@example.com" }
    question "Where were you born?"
    answer 'London'
    active false
  end
end
