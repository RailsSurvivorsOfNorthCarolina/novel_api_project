class GameWeather
  attr_reader :game

  def initialize(game)
    @game = game
  end

  def user_game_search
    game_review = GameReview.new(game)
    games = game_review.game_info
    dates = game_review.date_converter
    weather_details = HistoricalWeather.new(dates).weather_info
    count = 0
    output = games.map do |game|
      hash = {
      title: game["title"],
      score: game["score"],
      review_release_date: game["review_release_date"],
      temperature: weather_details[count]["temperature"],
      rain: weather_details[count]["rain"],
      conditions: weather_details[count]["conditions"]
      }
      count += 1
      hash
    end
  output.sort_by {|key| key[:score]}.reverse
  end
end
