class HistoricalWeather
  def initialize(date)
    @date = date
    @weather_data = get_data
  end

  def temperature(index)
    @weather_data[index]["history"]["observations"][0]["tempi"]
  end


  def rainfall(index)
    @weather_data[index]["history"]["observations"][0]["rain"]
  end


  def climate_conditions(index)
    @weather_data[index]["history"]["observations"][0]["conds"]
  end

  def weather_info
    count = 0
    output = @date.map do |d|
      if d == ""
        weather_hash = {}
        weather_hash["temperature"] = "no info"
        weather_hash["rain"] = "no info"
        weather_hash["conditions"] = "no info"
        weather_hash
      else
        weather_hash = {}
        weather_hash["temperature"] = self.temperature(count)
        weather_hash["rain"] = self.rainfall(count)
        weather_hash["conditions"] = self.climate_conditions(count)
        weather_hash
      end
      count += 1
      weather_hash
    end
    output
  end


  def get_data
    output = @date.map do |date|
      HTTParty.get("http://api.wunderground.com/api/#{ENV["WU_KEY"]}/history_#{date}/q/CA/San_Francisco.json")
    end
    output
  end
end
