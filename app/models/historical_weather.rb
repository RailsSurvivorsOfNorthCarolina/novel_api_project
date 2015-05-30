class HistoricalWeather
  def initialize(date)
    @date = date
    @weather_data = get_data
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

  def weather_info
    weather_array = []
    weather_hash = {}
    weather_hash["temperature"] = self.temperature
    weather_hash["rain"] = self.rainfall
    weather_hash["conditions"] = self.climate_conditions
    weather_array << weather_hash
  end


  def get_data
    HTTParty.get("http://api.wunderground.com/api/#{ENV["WU_KEY"]}/history_#{@date}/q/CA/San_Francisco.json")
  end
end
