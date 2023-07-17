# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

100.times do |i|
  Movie.create(name: Faker::Movie.title)
end

10.times do |i|
  Client.create(name: Faker::Name.name, age: Faker::Number.between(from: 18, to: 100))
end

# Crea o inserta registros predefinidos en nuestra tabla 
# rails db:seed

#10.times do |i|
#   User.create(nombre: Faker::Name.name, email:Faker::Internet.email)
#end