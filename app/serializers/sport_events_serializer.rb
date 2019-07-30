class SportEventsSerializer < ActiveModel::Serializer
  attributes :sport, :events

  def sport
    object.sport_name
  end

  def events
    event_list = []
    object.events.each { |event| event_list << event.event_name}

    event_list
  end

end
