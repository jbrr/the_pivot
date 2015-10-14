class Admin::CandidatesController < ApplicationController
  def show
    @candidate = Candidate.find(params[:id])
    @issues = CandidateIssue.find(params[:id])
  end

  def edit
  end

  def update
  end
end
