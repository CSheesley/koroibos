require 'rails_helper'

describe 'Olympians API' do
  context 'GET api/v1/olympians' do
    before :each do
      diving = create(:sport, sport_name:'Diving')
      taekwondo = create(:sport, sport_name: 'Taekwondo')
      basketball = create(:sport, sport_name: 'Basketball')

      egypt = create(:team, country_name: 'Egypt')
      jordan = create(:team, country_name: 'Jordan')
      brazil = create(:team, country_name: 'Brazil')

      maha = create(:olympian, name:'Maha Abdalsalam', age: 18, team_id: egypt.id)
      ahmad = create(:olympian, name:'Ahmad Abughaush', age: 20, team_id: jordan.id)
      ana = create(:olympian, name:'Ana Fernandez', age: 25, team_id: brazil.id)

      high_dive = create(:event, event_name: "Swimming High Dive")
      sparring = create(:event, event_name: "Taekwondo Sparring")
      team_duel = create(:event, event_name: "Taekwondo Team Duel")
      basketball = create(:event, event_name: "Basketball Women's Basketball")

      create(:olympian_event, olympian_id: maha.id, event_id: high_dive.id, medal: 0)
      create(:olympian_event, olympian_id: ahmad.id, event_id: sparring.id, medal: 1)
      create(:olympian_event, olympian_id: ahmad.id, event_id: team_duel.id, medal: 2)
      create(:olympian_event, olympian_id: ana.id, event_id: basketball.id, medal: 3)
    end

    it 'returns all olympians - name, team, age, sport, medals won' do

      get '/api/v1/olympians'

      olympian_data = JSON.parse(response.body)

      expected = '{
                    "olympians":
                      [
                        {
                          "name": "Maha Abdalsalam",
                          "team": "Egypt",
                          "age": 18,
                          "sport": "Diving",
                          "total_medals_won": 0
                        },
                        {
                          "name": "Ahmad Abughaush",
                          "team": "Jordan",
                          "age": 20,
                          "sport": "Taekwondo",
                          "total_medals_won": 2
                        },
                        {
                          "name": "Ana Fernandez",
                          "team": "Brazil",
                          "age": 25,
                          "sport": "Basketball"
                          "total_medals_won": 1
                        }
                      ]
                  }'

      expect(response.status).to eq(200)
      expect(olympian_data).to eq(expected)
    end
  end
end
