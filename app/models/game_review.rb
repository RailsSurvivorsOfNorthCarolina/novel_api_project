class GameReview
  attr_reader :our_game
  def initialize(game)
    @game = game
    @page = get_data
    @our_game_array = []
    #HTTParty.get("https://videogamesrating.p.mashape.com/get.php?count=5&game=#{game}",
                          # headers: {"X-Mashape-Key" => "#{ENV['IGN_KEY']}","Accept" => "application/json"})
  end

  def array_count
    @page.count
  end

  def find_game_we_search_for
    # @page[0]["title"]
    # @page[0..(array_count-1)]["title"] == @game
    @page.select do |g|
      if g["title"].include?@game
        our_game_array << g
      end
    end
    @our_game_array
  end

  def review_score
    @page["score"].to_f
  end

  def get_title
    @our_game_array[0][:title]
  end

  def review_date
    @page["short_description"].match(/\A[A-Z]\w+\s\d{2}\,\s\d{4}\z/)
  end

  def get_data
    HTTParty.get("https://videogamesrating.p.mashape.com/get.php?count=5&game=#{@game}", headers: {"X-Mashape-Key" => "#{ENV["IGN_KEY"]}","Accept" => "application/json"})
  end
end
