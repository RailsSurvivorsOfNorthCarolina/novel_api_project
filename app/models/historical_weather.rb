class HistoricalWeather
  def initialize(date)
    @weather_data = get_data
    @date = date
  end

  def temperature
    @weather_data["history"]["observations"][0]["tempi"]
  end


  def rainfall
    @weather_data["history"]["observations"][0]["rain"]
  end


  def climate_conditions
    @weather_data["history"]["observations"][0]["conds"]
  end


  def get_data
    HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/history_#{@date}/q/CA/San_Francisco.json")
  end
end
