5.times do |i|
  User.find_each do |user|
    puts "\"#{user.name}\" posted something!"
    user.tweets.create({ content: Faker::Hacker.say_something_smart, user_id: user.id })
  end
end