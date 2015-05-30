class GameReviewsController < ApplicationController
  def show
    # game = GameReview.new(params[:game]).game_info
    # weather_date = game.date_converter
    # weather_details = HistoricalWeather.new(params[:weather_date])
    # render json: game + weather_details
    render json: GameReview.new(params[:game]).game_info
  end

  def weather_show
    render json: HistoricalWeather.new(params[:date]).weather_info
  end
end
