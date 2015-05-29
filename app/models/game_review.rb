class GameReview
  # attr_reader :our_game_array
  def initialize(game)
    @game = game
    @page = get_data
    # @our_game_array = []
    #HTTParty.get("https://videogamesrating.p.mashape.com/get.php?count=5&game=#{game}",
                          # headers: {"X-Mashape-Key" => "#{ENV['IGN_KEY']}","Accept" => "application/json"})
  end

  def array_count
    @page.count
  end

  def find_game
    # @page[0]["title"]
    # @page[0..(array_count-1)]["title"] == @game
    our_game_array=[]
    @page.select do |g|
      if g["title"].include?@game
        our_game_array << g
      end
    end
    our_game_array.join
  end

  def review_score
    our_game_score=""
    @page.select do |g|
      if g["title"].include?@game
        our_game_score << g["score"]
      end
    end
    our_game_score
  end

  def get_title
    our_game_title=""
    @page.select do |g|
      if g["title"].include?@game
        our_game_title << g["title"]
      end
    end
    our_game_title
  end

  def review_date
    @page["short_description"].match(/\A[A-Z]\w+\s\d{2}\,\s\d{4}/)
  end

  def get_data
    HTTParty.get("https://videogamesrating.p.mashape.com/get.php?count=5&game=#{@game}", headers: {"X-Mashape-Key" => "#{ENV["IGN_KEY"]}","Accept" => "application/json"})
  end
end
