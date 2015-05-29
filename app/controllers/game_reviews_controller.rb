class GameReviewsController < ApplicationController
  def show
    render json: GameReview.new(params[:title])
  end

  def danai
    

  end
end
