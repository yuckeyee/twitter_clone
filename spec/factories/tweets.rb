FactoryBot.define do
  factory :tweet do
    content Faker::Hacker.say_something_smart
  end
end
