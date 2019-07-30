require 'rails_helper'

describe 'Olympian Stats API' do
  context 'GET api/v1/olympian_stats' do
    
    it 'returns overall olympians stats - total, avg age, avg weight' do
      create(:olympian, name:'Abbey', sex: 0, age: 27, height: 160, weight: 58)
      create(:olympian, name:'Betsy', sex: 0, age: 30, height: 167, weight: 61)
      create(:olympian, name:'Corey', sex: 1, age: 31, height: 182, weight: 82)
      create(:olympian, name:'Derek', sex: 1, age: 39, height: 188, weight: 85)

      get '/api/v1/olympian_stats'

      olympian_stats = JSON.parse(response.body)

      expected =  {
                    "olympian_stats" => {
                      "total_competing_olympians" => 4,
                      "average_weight" => {
                        "unit" => "kg",
                        "male_olympians" => 83.5,
                        "female_olympians" => 59.5
                      },
                      "average_age" => 31.8
                    }
                  }

      expect(response.status).to eq(200)
      expect(olympian_stats).to eq(expected)
    end
  end

end
