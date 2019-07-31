class Event < ApplicationRecord
  validates_presence_of :event_name

  has_many :olympian_events
  has_many :olympians, through: :olympian_events

  belongs_to :sport

  def medalists
    Olympian.joins(:olympian_events)
            .select(:name, :age, :team_id, "olympian_events.medal")
            .where("olympian_events.event_id = ?", self.id)
            .where.not("olympian_events.medal = ?", 0)
  end

end
