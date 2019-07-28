class OlympianEvent < ApplicationRecord
  validates_presence_of :games
  validates_presence_of :medal

  belongs_to :olympian
  belongs_to :event

  enum medal: ['NA', 'Gold', 'Silver', 'Bronze']
end
