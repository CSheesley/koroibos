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

end
