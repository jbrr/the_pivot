class DonationsController < ApplicationController

  def create
    candidate_issue_id = params[:donation][:candidate_issue_id]
    session[:donations] ||= {}

    if session[:donations][candidate_issue_id]
      session[:donations][candidate_issue_id] = (session[:donations][candidate_issue_id].to_i + params[:donation][:amount].to_i).to_s
    else
      session[:donations][candidate_issue_id] = params[:donation][:amount]
    end

    direct_to
  end

  def direct_to
    candidate_id = params[:donation][:candidate_id]
    issue_id     = params[:donation][:issue_id]

    if candidate_id
      redirect_to(candidate_path(candidate_id))
    else
      redirect_to(issue_path(issue_id))
    end
  end
end