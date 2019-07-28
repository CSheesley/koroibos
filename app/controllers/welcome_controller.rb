class WelcomeController < ApplicationController

  def index
    render json: {"welcome": "thank you for visiting koroibos-2016.herokuapp.com - for API documentation and more, visit https://github.com/CSheesley/koroibos"}
  end

end
