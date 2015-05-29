class HistoricalWeather
  def initialize
    @weather_data = get_data
    @date = date
  end

  def temperature

  end

  def get_data
    HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/history_#{@date}/q/CA/San_Francisco.json")
  end
end
