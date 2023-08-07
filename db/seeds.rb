# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Attendance.destroy_all
User.destroy_all
Event.destroy_all


users = []

10.times do
    users = User.create!(email: Faker::Internet.email, encrypted_password: "password", description: Faker::Lorem.sentence(word_count: 10), first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,)
end

events = []

10.times do
    Event.create!(start_date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 30), duration: rand(1..12) * 5,
      title: Faker::Lorem.sentence(word_count: 5), description: Faker::Lorem.paragraph(sentence_count: 3),
      price: rand(1..1000), location: Faker::Address.full_address,
      administrator: User.all.sample)
end

attendances = []

10.times do
    Attendance.create!(stripe_customer_id: "stripe_customer_#{rand(1..100)}", user: User.all.sample, event: Event.all.sample)
  end

  