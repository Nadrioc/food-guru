# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Cleaning database...'
User.destroy_all
Lesson.destroy_all

puts 'Creating 5 fake USERS...'
5.times do
  user = User.new(
    first_name: Faker::Artist.name,
    last_name:  Faker::Name.last_name,
    email:      Faker::Internet.email,
    password:   Faker::Internet.password
  )
  user.save!
end
puts 'Finished Users!'

p

puts 'Creating 5 fake LESSONS...'
5.times do
  lesson = Lesson.new(
    cuisine:  Faker::Address.country,
    location: Faker::Address.city,
    title:    Faker::ChuckNorris.fact,
    user:  User.all.sample
  )
  lesson.save!
end
puts 'Finished Lessons!'
