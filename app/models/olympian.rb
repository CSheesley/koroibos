class Olympian < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :sex
  validates_presence_of :age
  validates_presence_of :height
  validates_presence_of :weight

  has_many :olympian_events
  has_many :events, through: :olympian_events

  belongs_to :team

  enum sex: ['F', 'M']
end
