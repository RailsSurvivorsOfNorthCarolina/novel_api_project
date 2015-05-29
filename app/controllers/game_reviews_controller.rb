class GameReviewsController < ApplicationController
  def show
    render json: GameReview.new(params[:game])
  end

  def danai


  end
end
