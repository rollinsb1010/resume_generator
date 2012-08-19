# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    title { Faker::Lorem.words(3)}
    description { Faker::Lorem.paragraphs(3)}
    duration "20 days"
  end
end
