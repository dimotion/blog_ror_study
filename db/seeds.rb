# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
first_user = User.create(first_name: "John", last_name: "Travolta", login: "JT")

first_post = first_user.posts.create(title: "IT", body: "Lorem Ipsum")
second_post = first_user.posts.create(title: "Asus", body: "Lorem Ipsum Asus")
third_post = first_user.posts.create(title: "Dell", body: "Lorem Ipsum Dell")

first_user.posts.each do |post|
  5.times do |i|
    post.comments.create(title: "Title #{i}", message: "Message #{i}")
  end
end
