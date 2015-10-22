class CandidateIssuesController < ApplicationController

  def update
    candidate_issue.update(candidate_issue_params)
    flash[:success] = "Stance Successfully Updated"
    redirect_to edit_admin_candidate_path(candidate: candidate_issue.candidate.slug)
  end

  private

  def candidate_issue_params
    params.require(:candidate_issue).permit(:stance, :goal)
  end

  def candidate_issue
    CandidateIssue.find(params[:id])
  end
end
