FactoryBot.define do
  factory :event do
    association :sport, factory: :sport

    event_name {
                  [
                    "Athletics Men's 5,000 metres",
                    "Basketball Women's Basketball",
                    "Boxing Men's Flyweight",
                    "Sailing Men's One Person Dinghy",
                    "Table Tennis Women's Singles",
                    "Volleyball Women's Volleyball"
                  ].sample
               }
  end
end
