# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Applicant.destroy_all
Application.destroy_all

applicant_1 = Applicant.create!(name: 'foo bar', address: '1 main st', city: 'denver', state: 'co', zip_code: 12345)
applicant_2 = Applicant.create!(name: 'baz foo', address: '10 downing st', city: 'london', state: 'co', zip_code: 54321)
applicant_1.applications.create!(status: 'in progress', submitted: false, description: 'suitable')
applicant_2.applications.create!(status: 'pending', submitted: false, description: 'animal lover')
