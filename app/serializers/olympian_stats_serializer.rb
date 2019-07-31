class OlympianStatsSerializer < ActiveModel::Serializer
  attributes :total_competing_olympians, :average_weight, :average_age

  def total_competing_olympians
    Olympian.count
  end

  def average_weight
    {
      unit: 'kg',
      male_olympians: Olympian.average_weight("M"),
      female_olympians: Olympian.average_weight("F")
    }
  end

  def average_age
    Olympian.average_age
  end

end
