class Admin::CandidatesController < ApplicationController
  def show
    @candidate = Candidate.find(params[:id])
    @candidate_issues = CandidateIssue.where(candidate_id: params[:id]).to_a
    @stances = @candidate_issues.map { |ci| ci.stance }
    require 'pry' ; binding.pry
  end

  def edit
  end

  def update
  end

  private

  def candidate_id

  end
end
