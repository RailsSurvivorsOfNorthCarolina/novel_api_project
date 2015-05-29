require 'test_helper'

class GameReview
  def get_data
    JSON.parse(File.open('./game_reviews.json').read)
  end
end

class GameReviewTest < ActiveSupport::TestCase
  def test_get_review_score
    game = GameReview.new("The Witcher 2")
    assert_equal 9, game.review_score
  end
end
