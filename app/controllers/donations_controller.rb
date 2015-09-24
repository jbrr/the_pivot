class DonationsController < ApplicationController

  def create
    add(session[:donations])
    session[:donations] = raw_data

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

  def add(donations)
    candidate_issue_id = params[:donation][:candidate_issue_id]
    donations ||= {}

    if donations[candidate_issue_id]
      donations[candidate_issue_id] = (donations[candidate_issue_id].to_i + params[:donation][:amount].to_i).to_s
    else
      donations[candidate_issue_id] = params[:donation][:amount]
    end
    @raw_data = donations
  end

  def raw_data
    @raw_data
  end
end
