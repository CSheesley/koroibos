class Api::V1::MedalistsController < ApplicationController

  def index
    render json: Event.find(params[:id]),
           serializer: MedalistsSerializer,
           adapter: :attributes
  end

end
