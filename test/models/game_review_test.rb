require 'test_helper'

class GameReviews
  private def get_data
    @page = Jason.parse(File.open("game_review.json").read)
  end
end

class GameReviewTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end
end
