class Api::V1::OlympiansController < ApplicationController

  def index
    if youngest?
      render json: Olympian.youngest
    elsif oldest?
      render json: Olympian.oldest
    elsif find_by_age?
      render json: Olympian.where(age: params[:age])
    else
      render json: Olympian.all
    end
  end

private

    def youngest?
      params[:age] == "youngest"
    end

    def oldest?
      params[:age] == "oldest"
    end

    def find_by_age?
      params[:age].to_i > 0
    end

end
