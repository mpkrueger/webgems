require 'faker'

# Create Users
user = User.new(name: "Matthew", email: "mpkrueger@gmail.com", password: "password")
user.skip_confirmation!
user.save!

user1 = User.new(name: "Matt", email: "matt@example.com", password: "password")
user1.skip_confirmation!
user1.save!

user2 = User.new(name: "Jessica", email: "jessica@example.com", password: "password")
user2.skip_confirmation!
user2.save!

users = User.all


# Create Topics
15.times do
  Topic.create!(
    title: Faker::Lorem.word,
    user: users.sample
  )
end
topics = Topic.all

# Create Bookmarks
100.times do
  Bookmark.create!(
    url: Faker::Lorem.sentence,
    topic: topics.sample
  )
end
bookmarks = Bookmark.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"