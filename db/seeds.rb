# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

puts 'Creating user'
bob = User.create!(name: 'Bob', city:'Paris', email:'bob@bob.com', password: 'password')
puts 'User created'

puts "Let's start the seed for flowers..."

puts "Destroy the database"
Seedpack.destroy_all
puts "Destruction done!!!!!!!!!!!!!"

puts "start the seed"
filepath = "db/json-flowers.json"

serialized_flowers = File.read(filepath)

flowers = JSON.parse(serialized_flowers)

f = flowers.flatten[1]


f.each do |seed|
  Seedpack.create!(
    name: seed['name'],
    number: seed['number'].to_i,
    description: seed['description'],
    image: seed['image'],
    price: seed['price'].to_i,
    user: bob
  )
end

puts "seed finished"
