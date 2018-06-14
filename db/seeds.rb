# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

require 'faker'

puts 'Cleaning database...'
Lesson.destroy_all
User.destroy_all


puts 'Creating 3 fake USERS...'
3.times do
  user = User.new(
    first_name: Faker::Artist.name,
    last_name:  Faker::Name.last_name,
    email:      Faker::Internet.email,
    password:   Faker::Internet.password,
    image:      'https://mickgrom.github.io/profile/images/profilepicmick.jpg'
  )
  user.save!
end
puts 'Finished Users!'

p

images = [
  'https://images.pexels.com/photos/375889/pexels-photo-375889.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  'https://images.pexels.com/photos/298926/woman-kitchen-man-everyday-life-298926.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  'https://images.pexels.com/photos/6245/kitchen-cooking-interior-decor.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  'https://images.pexels.com/photos/106877/pexels-photo-106877.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  'https://images.pexels.com/photos/33242/cooking-ingredient-cuisine-kitchen.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  'https://images.pexels.com/photos/375468/pexels-photo-375468.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  'https://images.pexels.com/photos/271458/pexels-photo-271458.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  'https://images.pexels.com/photos/66639/pexels-photo-66639.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  'https://images.pexels.com/photos/8572/food-chicken-meat-outdoors.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'
]

cuisines = ["French", "Mexican", "Chinese", "Japanese", "German", "American", "Italian", "Indonesian", "Peruvian", "Argentinien", "Spanish" ]

puts 'Creating 3. fake LESSONS...'
3.times do
  lesson = Lesson.new(
    cuisine:    cuisines.sample,
    location:   Faker::Address.city,
    title:      Faker::Book.title,
    user:       User.all.sample,
    description:Faker::GameOfThrones.quote,
    capacity:   [1,2,3,4,5,12,8,16,9].sample,
    price:      [10,12,13,14,15,12,18,16,19].sample
  )
  lesson.remote_image_url = images.sample
  lesson.save!
end
puts 'Finished Lessons!'
