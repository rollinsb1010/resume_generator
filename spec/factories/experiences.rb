# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :experience do
    resume nil
    title { Faker::Lorem.words(3)}
    company{ Faker::Company.name}
    place{ Faker::Address.city}
    from_date "2012-01-01"
    until_date "2012-02-01"
    description { Faker::Lorem.paragraph(1)}
  end
end
