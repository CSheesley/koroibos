class Api::V1::OlympianStatsController < ApplicationController

  def index
    render json: Olympian.class, serializer: OlympianStatsSerializer, root: 'olympian_stats'
  end

end
