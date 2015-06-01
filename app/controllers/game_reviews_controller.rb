class GameReviewsController < ApplicationController
  def show
    output = GameWeather.new(params[:game]).user_game_search
    render json: output
  end
end
