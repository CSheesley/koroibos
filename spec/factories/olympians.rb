FactoryBot.define do
  factory :olympian do
    association :team, factory: :team

    name { Faker::Name.name }
    sex { Faker::Number.between(0, 1) }
    age { Faker::Number.between(15, 65) }
    height { Faker::Number.between(150, 200) }
    weight { Faker::Number.between(50, 125) }
  end
end
