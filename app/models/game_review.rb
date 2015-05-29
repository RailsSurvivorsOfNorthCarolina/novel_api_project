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


  def date_converter
    month_hash = {
      "January" => "01", "February" => "02", "March" => "03", "April" => "04",
      "May" => "05", "June" => "06", "July" => "07", "August" => "08",
      "September" => "09", "October" => "10", "Noverber" => "11", "December" => "12"
    }
    month_hash[:January]
      game_string = @page[0]["short_description"]

      game_date = game_string.match(/[A-Z]\w+\s\d{2}\,\s\d{4}/)
      game_date = game_date.to_s

      game_year = game_date.match(/\d{4}/)
      game_year = game_year.to_s

      game_day = game_date.match(/\d{2},/)
      game_day = game_day.to_s
      game_day = game_day.gsub(",","")

      game_month = game_date.match(/\A\w{0,100}/)
      game_month = game_month.to_s
      game_month = month_hash[game_month]

      game_year+game_month+game_day

    #  game_year.to_s

  end

  def get_data
    HTTParty.get("https://videogamesrating.p.mashape.com/get.php?count=5&game=#{@game}", headers: {"X-Mashape-Key" => "#{ENV["IGN_KEY"]}","Accept" => "application/json"})
  end
end
