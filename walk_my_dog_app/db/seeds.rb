require 'faker'
require 'colorize'

puts "Cleaning DB ...".colorize(:blue)
Stroll.destroy_all #destroy children bedore parents to avoid conflicts
Dogsitter.destroy_all
Dog.destroy_all
City.destroy_all

puts "------------------------"
puts "Creating Cities...".colorize(:light_blue)
cities_list = []
50.times do
  city = City.create(city_name: Faker::Address.city)
  cities_list << city
end
puts "Cities created: #{City.count}".colorize(:light_green)

puts "------------------------"
puts "Creating Dogsitters...".colorize(:light_blue)
100.times do
  Dogsitter.create(
    name: Faker::Name.first_name,
    email: Faker::Internet.email,
    city: cities_list.sample
  )
end
puts "Dogsitters created: #{Dogsitter.count}".colorize(:light_green)

puts "------------------------"
puts "Creating Dogs...".colorize(:light_blue)
100.times do
  Dog.create(
  name: Faker::Creature::Dog.name, 
  age: Faker::Creature::Dog.age,
  race: Faker::Creature::Dog.breed,
  city: cities_list.sample
  )
end
puts "Dogs created: #{Dog.count}".colorize(:light_green)

puts "------------------------"
puts "Creating Strolls ...".colorize(:light_blue)
500.times do
  city_target = cities_list.sample
  if city_target.dogs.count > 0 && city_target.dogsitters.count > 0 #check if dogs&sitters are in same target city
    Stroll.create(
      date: Faker::Time.forward(days: 5, period: :day),
      dogsitter: city_target.dogsitters.sample,
      dog: city_target.dogs.sample
    )
  end
end
puts "All strolls created ! Have a good time ! ".colorize(:light_green)
puts "------------------------"
puts "--- Seeds done ! ---".colorize(:light_green)