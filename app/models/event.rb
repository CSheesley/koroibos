class Event < ApplicationRecord
  validates_presence_of :event_name

  has_many :olympian_events
  has_many :olympians, through: :olympian_events

  belongs_to :sport
end
