# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do
  User.create!(username: Faker::Internet.user_name)
end

10.times do |i|
  3.times do
    Contact.create!(user_id: i+1, name: Faker::Name.name, email: Faker::Internet.email)
  end
end

20.times do
  ContactShare.create!(user_id: rand(10) + 1, contact_id: rand(30) + 1)
end
