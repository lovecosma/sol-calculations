# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

u = User.create(email: 'test@test.com', password: '123456')

a = Chart.create!(first_name: "Jasmine", middle_name: "Monique ", last_name: "Alexander-Williams", birthdate: Date.new(1994, 7, 23), user: u)
 Chart.create!(first_name: "Osho", last_name: " Williams", birthdate: Date.new(2022, 3, 23), user: u)

u.personal_chart = a
u.save
