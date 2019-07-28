class Team < ApplicationRecord
  validates_presence_of :country_name

  has_many :olympians
end
