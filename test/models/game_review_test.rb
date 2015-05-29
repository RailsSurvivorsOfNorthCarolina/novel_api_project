require 'test_helper'
require 'game_review'

class GameReview
  def get_data
    JSON.parse(File.open("#{Rails.root}/test/models/game_review.json").read)
  end
end


class GameReviewTest < ActiveSupport::TestCase
  # def test_get_review_score
  #   game = GameReview.new("The Witcher 2")
  #   assert_equal 9, game.review_score
  # end
  #
  # test "can find game searched by user" do
  #   game = GameReview.new("The Witcher 2")
  #   assert_equal true, game.find_game_we_search_for.scan(/The Witcher 2/)
  # end

  def test_convert_game_date_into_weather_date
    game = GameReview.new("The Witcher 2")
    assert_equal "20110517", game.date_converter
  end

  # test "can get title from game" do
  #   game = GameReview.new("The Witcher 2: Assassins of Kings")
  #   assert_equal "The Witcher 2: Assassins of Kings", game.get_title
  # end
end
