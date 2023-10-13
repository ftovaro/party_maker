class PartiesController < ApplicationController
  def show
   @party = Party.includes(party_associations).find(params[:id])
  end

  private

  def party_associations
    { polls: [ items: [ :votes ] ] }
  end
end