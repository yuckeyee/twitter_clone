FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "test#{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password Faker::Internet.password(8)
  end
end
