require 'rails_helper'

describe 'testing that factory bot set up works' do
  it 'can create instances of teams' do
    team = create(:team)
    teams = create_list(:team, 2)

    expect(Team.count).to eq(3)
  end

  it 'can create instances of olympians' do
    olympian = create(:olympian)
    olympians = create_list(:olympian, 2)

    expect(Olympian.count).to eq(3)
  end

  it 'can create instances of olympian_events' do
    olympian_event = create(:olympian_event)
    olympian_events = create_list(:olympian_event, 2)

    expect(OlympianEvent.count).to eq(3)
  end

  it 'can create instances of events' do
    event = create(:event)
    events = create_list(:event, 2)

    expect(Event.count).to eq(3)
  end

  it 'can create instances of sports' do
    sport = create(:sport)
    sports = create_list(:sport, 2)

    expect(Sport.count).to eq(3)
  end
end
