class GameReviewsController < ApplicationController
  def show
    game = GameReview.new(params[:game]).game_info
    date = GameReview.new(params[:game]).date_converter
    weather_details = HistoricalWeather.new(date).weather_info
    output = []
    count = 0
    game.each do |g|
      hash = {}
        hash["title"] = g["title"]
        hash["score"] = g["score"]
        hash["review_release_date"] = g["review_release_date"]
        hash["temperature"] = weather_details[count]["temperature"]
        hash["rain"] = weather_details[count]["rain"]
        hash["conditions"] = weather_details[count]["conditions"]
        output << hash
        count += 1
    end
    render json: output
  end
end
