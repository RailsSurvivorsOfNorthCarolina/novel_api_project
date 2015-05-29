class GameReview
  def initialize(game)
    @game = game
    @page = get_data.first
    #HTTParty.get("https://videogamesrating.p.mashape.com/get.php?count=5&game=#{game}",
                          # headers: {"X-Mashape-Key" => "#{ENV['IGN_KEY']}","Accept" => "application/json"})
  end

  def review_score
    @page["score"].to_f
  end

  def get_title
    @page["title"]
  end

  def review_date
    @page["short_description"].match(/\A[A-Z]\w+\s\d{2}\,\s\d{4}\z/)
  end

  def get_data
    HTTParty.get("https://videogamesrating.p.mashape.com/get.php?count=5&game=#{@game}", headers: {"X-Mashape-Key" => "#{ENV["IGN_KEY"]}","Accept" => "application/json"})
  end
end
