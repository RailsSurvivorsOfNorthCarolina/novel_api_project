class GameReviewsController < ApplicationController
  def show
    render json: GameReview.new(params[:game]).game_hash
  end

  def danai


  end
end
