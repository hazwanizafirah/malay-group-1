# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.create!(name: "Admin",
             email:  "mail21@email.com",
             password:              "111111",
             password_confirmation: "111111",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: "Admin2",
             email:  "mail22@email.com",
             password:              "111111",
             password_confirmation: "111111",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

5.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

5.times do |n|
  name = "Subject-#{n+1}"
  description = Faker::Lorem.sentence(word_count: 5)
  status = 0
  Course.create!(
    name: name,
    description: description,
    status: status)
end
