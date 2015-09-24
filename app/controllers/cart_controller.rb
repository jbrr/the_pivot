class CartController < ApplicationController
  helper_method :candidate, :issue

  def show
    @donations = session[:donations]
  end

private

  def candidate(candidate_issue_id)
    CandidateIssue.find(candidate_issue_id).candidate.name
  end

  def issue(candidate_issue_id)
    CandidateIssue.find(candidate_issue_id).issue.topic
  end

end
