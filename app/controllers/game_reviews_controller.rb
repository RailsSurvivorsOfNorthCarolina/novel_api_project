class GameReviewsController < ApplicationController
  def show
    # game = GameReview.new(params[:game]).game_info
    # weather_date = game.date_converter
    # weather_details = HistoricalWeather.new(weather_date)
    # render json: game + weather_details
    date = GameReview.new(params[:game]).date_converter
    render json: HistoricalWeather.new(date).weather_info

  end

  def weather_show
  end
end
