# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Creating 10 fake users...'
10.times do
  user = User.new(
    name: Faker::Name,
    bio: Faker::Lorem,
    email: Faker::Internet.email,
    avatar: url="https://source.unsplash.com/featured/?face"
  )
  user.save!
end
puts 'Finished!'
