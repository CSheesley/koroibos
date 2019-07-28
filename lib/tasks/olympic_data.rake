require 'csv'

namespace :olympic_data do
  desc "imports olympic data from 2016 summer games"
  task import_2016: :environment do

    CSV.foreach('./db/olympic_data_2016.csv', headers: true) do |row|

      country = row['Team'].split('-')[0]

      team = Team.find_or_create_by(country_name: country)

      olympian = Olympian.find_or_create_by(name: row['Name']) do |olympian|
        olympian.sex = row['Sex']
        olympian.age = row['Age']
        olympian.height = row['Height']
        olympian.weight = row['Weight']
        olympian.team = team
      end

      sport = Sport.find_or_create_by(sport_name: row['Sport'])

      event = Event.find_or_create_by(event_name: row['Event']) do |event|
        event.sport = sport
      end

      OlympianEvent.create(
        games: row['Games'],
        medal: row['Medal'],
        olympian_id: olympian.id,
        event_id: event.id
      )
    end
  end
end
