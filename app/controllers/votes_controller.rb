class VotesController < ApplicationController
  def create
    vote = Vote.new(vote_params)
    vote.save!

    render turbo_stream: turbo_stream.replace(vote.item, partial: 'items/item', locals: { item: vote.item })
  end

  private

  def vote_params
    params.permit(:user_id, :item_id)
  end
end