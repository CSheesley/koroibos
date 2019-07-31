class MedalistsSerializer < ActiveModel::Serializer
  attributes :event, :medalists

  def event
    object.event_name
  end

  def medalists
    object.medalists.map do |olympian|
      {
        name: olympian.name,
        team: olympian.team.country_name,
        age: olympian.age,
        medal: medal_type(olympian.medal)
      }
    end
  end

  private

    def medal_type(medal_integer)
      if medal_integer == 1
        "Gold"
      elsif medal_integer == 2
        "Silver"
      else
        "Bronze"
      end
    end

end
