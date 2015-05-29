require 'test_helper'
require 'historical_weather'

class HistoricalWeather
  def get_data
    JSON.parse(File.open("#{Rails.root}/test/models/historical_weather.json").read)
  end
end

class HistoricalWeatherTest < ActiveSupport::TestCase


  def test_can_get_temperature
    temp = HistoricalWeather.new(20060405)
    assert_equal "50.0", temp.temperature
  end

end
