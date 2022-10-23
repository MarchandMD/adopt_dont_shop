require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ApplicationPet.destroy_all
Application.destroy_all
Pet.destroy_all
Shelter.destroy_all
VeterinaryOffice.destroy_all
Veterinarian.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('applications')
ActiveRecord::Base.connection.reset_pk_sequence!('pets')
ActiveRecord::Base.connection.reset_pk_sequence!('shelters')
ActiveRecord::Base.connection.reset_pk_sequence!('application_pets')
ActiveRecord::Base.connection.reset_pk_sequence!('veterinarians')
ActiveRecord::Base.connection.reset_pk_sequence!('veterinary_offices')

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

shelter = Shelter.create!(foster_program: true,
                name: 'Shelter 1',
                city: 'anywhere',
                rank: 1)

10.times do
  Pet.create!(adoptable: true,
              age: Faker::Number.between(from: 1, to: 15),
              breed: Faker::Creature::Dog.breed,
              name: Faker::Creature::Dog.name,
              shelter_id: shelter.id)
end
