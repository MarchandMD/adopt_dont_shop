require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Application.destroy_all

5.times do
  Application.create!(name: Faker::Name.name,
                      address: Faker::Address.street_address,
                      city: Faker::Address.city,
                      state: Faker::Address.state,
                      zip_code: Faker::Address.zip,
                      status: 'In progress',
                      submitted: false,
                      description: Faker::Lorem.sentence(word_count: 8))
end
