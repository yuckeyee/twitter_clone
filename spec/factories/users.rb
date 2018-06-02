FactoryBot.define do
  factory :user do
    name Faker::Internet.unique.user_name
    email Faker::Internet.unique.email
    password Faker::Internet.password(8)
  end
end
