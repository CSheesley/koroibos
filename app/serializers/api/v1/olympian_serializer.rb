class Api::V1::OlympianSerializer < ActiveModel::Serializer
  attributes :name, :team, :age, :sport, :total_medals_won

  def team
    object.country
  end

  def sport
    object.sport
  end

  def total_medals_won
    object.medals_won
  end
end
