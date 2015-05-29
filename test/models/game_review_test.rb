require 'test_helper'

require 'game_review'
class GameReview
  def get_data
    JSON.parse(File.open("#{Rails.root}/test/models/game_review.json").read)
  end
end

class GameReviewTest < ActiveSupport::TestCase
  def test_get_review_score
    game = GameReview.new("The Witcher 2")
    assert_equal 9, game.review_score
  end
end
