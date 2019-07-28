FactoryBot.define do
  factory :sport do
    sport_name {
                  [
                    "Athletics",
                    "Basketball",
                    "Boxing",
                    "Table Tennis",
                    "Trampolining",
                    "Volleyball"
                  ].sample
               }
  end
end
