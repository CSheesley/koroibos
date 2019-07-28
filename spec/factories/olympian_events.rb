FactoryBot.define do
  factory :olympian_event do
    olympian
    event

    games { "2016 Summer" }
    medal { Faker::Number.between(0, 3)}  
  end
end
