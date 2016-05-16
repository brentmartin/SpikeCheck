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

4.times do
  assess = Assessment.create(title:Faker::Name.title, description:Faker::Company.catch_phrase)
  15.times do
    Question.create(body:Faker::Company.bs + "?", assessment_id: assess.id)
  end
end

User.count.times do
  @survey = Survey.new(heading: Faker::StarWars.quote, intro: Faker::Hipster.paragraph(rand(2..5)), user_id: rand(1..User.count), assessment_id: rand(1..Assessment.count))
  @survey.save
  if @survey.save
    @survey.assessment.questions.each do |question|
      Selfevaluation.create(survey_id: @survey.id, question_id: question.id, completion:false)
    end
  end
end

Survey.all.each do |survey|
  rand(1..10).times do |n|
    @participation = Participation.new(relation: ["Work", "Friend", "Associate", "Family"].sample, user_id: rand(1..User.count), survey_id: survey.id)
    @participation.save
    if @participation.save
      @participation.survey.assessment.questions.each do |question|
        Evaluation.create(participation_id: @participation.id, question_id: question.id, completion:false)
      end
    end
  end
end

# [] Assessment seeds
# [] Question seeds
# [] Surveys seeds
# [] Selfevaluation seeds
# [] Participatio seeds
# [] Evaluation seeds
