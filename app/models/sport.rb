class Sport < ApplicationRecord
  validates_presence_of :sport_name

  has_many :events
end
