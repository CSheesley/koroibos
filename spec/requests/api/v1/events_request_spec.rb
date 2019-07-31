require 'rails_helper'

describe 'Events API' do

  context 'GET api/v1/events' do
    it 'returns all events - along with the sport that they belong to' do
      archery = create(:sport, sport_name: 'Archery')
      badminton = create(:sport, sport_name: 'Badminton')

      create(:event, event_name: "Archery Men's Individual", sport: archery)
      create(:event, event_name: "Archery Men's Team", sport: archery)
      create(:event, event_name: "Archery Women's Individual", sport: archery)
      create(:event, event_name: "Archery Women's Team", sport: archery)

      create(:event, event_name: "Badminton Men's Singles", sport: badminton)
      create(:event, event_name: "Badminton Women's Doubles", sport: badminton)
      create(:event, event_name: "Badminton Women's Singles", sport: badminton)
      create(:event, event_name: "Badminton Mixed Doubles", sport: badminton)

      get '/api/v1/events'

      event_data = JSON.parse(response.body)

      expected =  {
                    "events" =>
                      [
                        {
                          "sport" => "Archery",
                          "events" => [
                            "Archery Men's Individual",
                            "Archery Men's Team",
                            "Archery Women's Individual",
                            "Archery Women's Team"
                          ]
                        },
                        {
                          "sport" => "Badminton",
                          "events" => [
                            "Badminton Men's Singles",
                            "Badminton Women's Doubles",
                            "Badminton Women's Singles",
                            "Badminton Mixed Doubles"
                          ]
                        }
                      ]
                  }

      expect(response.status).to eq(200)
      expect(event_data).to eq(expected)
    end
  end

  context 'GET api/v1/events/:id/medalists' do
    it 'returns medalists info for a specified event - name, team, age, medal' do
      indonesia = create(:team, country_name: "Indonesia")
      malaysia = create(:team, country_name: "Malaysia")

      tontowi = create(:olympian, name: "Tontowi Ahmad", age: 29, team_id: indonesia.id )
      chan = create(:olympian, name: "Chan Peng Soon", age: 28, team_id: malaysia.id )

      event = create(:event, event_name: "Badminton Mixed Doubles")

      create(:olympian_event, olympian_id: tontowi.id, event_id: event.id, medal: 1)
      create(:olympian_event, olympian_id: chan.id, event_id: event.id, medal: 2)

      get "/api/v1/events/#{event.id}/medalists"

      medalists_data = JSON.parse(response.body)

      expected =  {
        "event" => "Badminton Mixed Doubles",
        "medalists" => [
            {
              "name" => "Tontowi Ahmad",
              "team" => "Indonesia",
              "age" => 29,
              "medal" => "Gold"
            },
            {
              "name" => "Chan Peng Soon",
              "team" => "Malaysia",
              "age" => 28,
              "medal" => "Silver"
            }
          ]
      }
      
      expect(response.status).to eq(200)
      expect(medalists_data).to eq(expected)
    end
  end

end
