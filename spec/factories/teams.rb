FactoryBot.define do
  factory :team do
    country_name { Faker::Address.country }
  end
end
