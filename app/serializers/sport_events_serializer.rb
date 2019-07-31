class SportEventsSerializer < ActiveModel::Serializer
  attributes :sport, :events

  def sport
    object.sport_name
  end

  def events
    object.events.map { |event| event.event_name }
  end

end
