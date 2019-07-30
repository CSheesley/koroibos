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

  def self.youngest
    where(age: minimum(:age))
  end

  def self.oldest
    where(age: maximum(:age))
  end

  def self.average_weight(gender)
    key = gender[0].upcase
    where(sex: key).average(:weight).to_f.round(1)
  end

  def self.average_age
    average(:age).to_f.round(1)
  end

  def country
    team.country_name
  end

  def sport
    events[0].sport.sport_name
  end

  def medals_won
    OlympianEvent.where(olympian_id: id)
                 .where.not(medal: "NA")
                 .count
  end

end
