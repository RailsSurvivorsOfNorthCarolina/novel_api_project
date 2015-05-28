class GameReview
  def initialize(game)
    @page = get_data
  end

  private def get_data
    get_data = HTTParty.get("https://videogamesrating.p.mashape.com/get.php?count=5&game=#{game}", headers: {"X-Mashape-Key" => "#{ENV["IGN_KEY"]}","Accept" => "application/json"})
  end
end
