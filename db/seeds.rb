# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

5.times do
  User.create!(
    email:      Faker::Internet.free_email,
    password:   "password"

  )
end

60.times do
  Item.create!(
    name:     Faker::Hipster.words(2).join,
    user:     User.all.sample
  )
end

u = User.first

u.update_attributes!(
  name:     JB,
  email:    'callitaclue@yahoo.com',
  password: 'password21'
)


puts "Seeds Complete"
puts "#{User.count} users created"
puts "#{Item.count} items created"
