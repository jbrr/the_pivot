class CandidateIssuesController < ApplicationController

  def update
    candidate_issue_candidate
    if candidate_issue.update(candidate_issue_params)
      flash[:success] = "Stance Successfully Updated"
      redirect_to edit_admin_candidate_path(candidate: candidate.slug)
    else
      flash[:danger] = "Do you need a tissue for you issue??"
      redirect_to edit_admin_candidate_path(candidate: candidate.slug)
    end
  end

  private

  def candidate_issue_params
    params.require(:candidate_issue).permit(:stance, :goal)
  end

  def candidate_issue_candidate
    candidate_issue = CandidateIssue.find(params[:id])
    candidate = candidate_issue.candidate
  end
end
