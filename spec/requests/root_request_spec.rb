require 'rails_helper'

describe 'Root Path' do
  context 'when I visit the root path' do
    it 'returns 200 status code with more information' do

      get '/'

      content = JSON.parse(response.body)

      expect(response.status).to eq(200)

      expect(content.keys[0]).to eq("welcome")
      expect(content["welcome"]).to eq("thank you for visiting koroibos-2016.herokuapp.com - for API documentation and more, visit https://github.com/CSheesley/koroibos")
    end
  end
end
