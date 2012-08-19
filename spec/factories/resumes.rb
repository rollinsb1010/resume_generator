# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :resume do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    intro {Faker::Lorem.paragraphs(3)}
  end

  factory :resume_filled_with_data, :parent => :resume do
  end
end
