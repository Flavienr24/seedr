# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroying: database"

Seedpack.destroy_all
User.destroy_all
user1 = User.create!(email:"seedr@seed.com", password:"password", name:"Flavien", city:"Marseille", avatar:"image", bio:"kkk")

puts "hello"
Seedpack.create!(name:"name", number:1, description: "description", image:"image", price: 2, user: user1)

p "seeds correctly done"

