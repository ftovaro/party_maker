class PartiesController < ApplicationController
  def index
    @parties = User.find(1).parties.order(created_at: :desc)
  end

  def show
   @party = Party.includes(party_associations).find(params[:id])
  end

  private

  def party_associations
    { polls: [ items: [ :votes ] ] }
  end
end