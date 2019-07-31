class Api::V1::EventsController < ApplicationController

  def index
    render json: Sport.all,
           each_serializer: SportEventsSerializer,
           root: 'events'
  end

end
