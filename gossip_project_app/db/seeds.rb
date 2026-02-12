require 'faker'

puts "Cleaning DB ..."
Like.destroy_all
Comment.destroy_all
JoinTableGossipTag.destroy_all
Tag.destroy_all
PrivateMessage.destroy_all
Gossip.destroy_all
User.destroy_all
City.destroy_all

puts "------------------------"
puts "Starting seeds ..."

puts "------------------------"
puts "Creating Cities..."
cities = []
10.times do
  city = City.create(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
  )
  cities << city
end
puts "Cities created: #{City.count}"

puts "------------------------"
puts "Creating Users..."
users = []
10.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence(word_count: 10),
    email: Faker::Internet.email,
    age: Faker::Number.between(from: 18, to: 80),
    city: cities.sample
  )
  users << user
end
puts "Users created: #{User.count}"

puts "------------------------"
puts "Creating Gossips..."
gossips = []
20.times do
  gossip = Gossip.create(
    title: Faker::Book.title,
    content: Faker::Lorem.paragraph(sentence_count: 2),
    user: users.sample
  )
  gossips << gossip
end
puts "Gossips created: #{Gossip.count}"

puts "------------------------"
puts "Creating Tags..."
tags = []
10.times do
  tag = Tag.create(title: "##{Faker::Hipster.word}")
  tags << tag
end
puts "Tags created: #{Tag.count}"

puts "------------------------"
puts "Assigning tags to gossips..."
gossips.each do |gossip|
  JoinTableGossipTag.create(
    gossip: gossip,
    tag: tags.sample
  )
end
puts "Gossips-Tags properly linked !"

puts "------------------------"
puts "Creating private messages..."
5.times do
  sender = users.sample
  recipient = users.sample
  # condition to check that send & recipient ARE different
  recipient = users.sample while sender == recipient
  PrivateMessage.create(
    content: Faker::Lorem.sentence(word_count: 5),
    sender: sender,
    recipient: recipient
  )
end
puts "PMs created: #{PrivateMessage.count}"

puts "------------------------"
puts "Creating comments..."
20.times do
  Comment.create(
    content: Faker::Lorem.sentence,
    user: users.sample,
    commentable: gossips.sample # Polymorphism: linked to gossip ; gossips are commentable
  )
end
puts "Comments created: #{Comment.count}"

puts "------------------------"
puts "Creating comments commenting other comments..."
10.times do
  parent_comment = Comment.all.sample
  if parent_comment # check if comment is not empty
    Comment.create(
      content: "Réponse : #{Faker::Lorem.sentence}",
      user: users.sample,
      commentable: parent_comment # Polymorphism : linked to comment ; comments are commentable
    )
  end
end
puts "10 Sub-comments created !"

puts "------------------------"
puts "Generating many likes..."
20.times do
  likeable_object = [Gossip.all.sample, Comment.all.sample].sample #random like to gossips/comments
  Like.create(
    user: users.sample,
    likeable: likeable_object # Gossip ou Comment are likeable
  )
end
puts "#{Like.count} likes generated !"
puts "------------------------"
puts "--- Seeds done ! ---"