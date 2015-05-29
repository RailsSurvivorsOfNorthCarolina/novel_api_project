require 'test_helper'
require 'historical_weather'

class HistoricalWeather
  def get_data
    JSON.parse(File.open("#{Rails.root}/test/models/historical_weather.json").read)
  end
end

class HistoricalWeatherTest < ActiveSupport::TestCase


  def test_can_get_temperature
    weather_date = HistoricalWeather.new(20060405)
    assert_equal "50.0", weather_date.temperature
  end


  def test_can_get_inches_of_rain
    weather_date = HistoricalWeather.new(20060405)
    assert_equal "0", weather_date.rainfall
  end


  def test_can_get_climate_conditions
    weather_date = HistoricalWeather.new(20060405)
    assert_equal "Mostly Cloudy", weather_date.climate_conditions
  end

end
