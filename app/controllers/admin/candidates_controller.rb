class Admin::CandidatesController < ApplicationController
  def show
    @candidate = Candidate.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def candidate_id

  end
end
