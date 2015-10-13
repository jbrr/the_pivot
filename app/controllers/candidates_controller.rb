class CandidatesController < ApplicationController
  def index
    @democrats = Candidate.where(party: "Democratic")
    @republicans = Candidate.where(party: "Republican")
  end

  def show
    @candidate = Candidate.find_by(slug: params[:candidate])
    require 'pry'; binding.pry

  end
end
