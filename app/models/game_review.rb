class GameReview < HistoricalWeather
  def initialize(game)
    @game = game
    @page = get_data
  end


  def array_count
    @page.count
  end

  def find_game
    game_array = @page.map {|g| g}
    game_array.join
  end

  def review_score
    @page.map {|g| g["score"]}
  end

  def get_title
    game_title=""
    @page.select do |g|
      if g["title"].include?@game
        game_title << g["title"]
      end
    end
    game_title
  end

  def game_info
    array = []
    @page.each do |g|
      hash = {}
      hash["title"] = g["title"]
      hash["score"] = g["score"]
      hash["review_release_date"] = g["short_description"].scan(/\A[A-Z]\w+\s\d{2}\,\s\d{4}/).join
      array << hash
    end
    array
  end


  def review_date
    @page.map {|g| (g["short_description"].scan(/\A[A-Z]\w+\s\d{2}\,\s\d{4}/))}
  end

  def date_converter
    month_hash = {
      "January" => "01", "February" => "02", "March" => "03", "April" => "04",
      "May" => "05", "June" => "06", "July" => "07", "August" => "08",
      "September" => "09", "October" => "10", "Noverber" => "11", "December" => "12"
    }
    date_array = []
    @page.each do |g|
      game_string = g["short_description"]

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

      date_array << "#{game_year}#{game_month}#{game_day}"
    end
    date_array
  end

  def get_data
    HTTParty.get("https://videogamesrating.p.mashape.com/get.php?count=5&game=#{@game}", headers: {"X-Mashape-Key" => "#{ENV["IGN_KEY"]}","Accept" => "application/json"})
  end
end
