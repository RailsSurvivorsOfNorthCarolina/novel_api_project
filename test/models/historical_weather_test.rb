require 'test_helper'
require 'historical_weather'

class HistoricalWeatherTest < ActiveSupport::TestCase

  def test_can_get_temperature
    temp = HistoricalWeather.new(20060405)
    assert_equal 50, temp.temperature
  end

end
