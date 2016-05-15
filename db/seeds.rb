# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# [x] User seeds
20.times do
  registered_user = User.create(name:Faker::Name.name, location:Faker::Address.city + ", " + Faker::Address.state_abbr, email:Faker::Internet.domain_word + "@example.com", password: "password",  registration:true)
end
# [] Assessment seeds
# [] Question seeds
# [] Surveys seeds
# [] Selfevaluation seeds
# [] Participatio seeds
# [] Evaluation seeds
