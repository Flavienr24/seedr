# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'faker'

Seedpack.destroy_all
User.destroy_all

puts 'Creating 10 fake users...'

10.times do
  user = User.new(
    name: Faker::Name.name,
    bio: Faker::Lorem.sentences,
    password: "password",
    city: Faker::Address.city,
    email: Faker::Internet.email,
    avatar: url="https://source.unsplash.com/featured/?face"
  )
  user.save!
end

puts 'Creating bob'

bob = User.create!(name: 'Bob', city:'Paris', email:'bob@bob.com', password: 'password')

puts 'bob created'

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
    user: User.new
  )
end

puts "seed finished"

