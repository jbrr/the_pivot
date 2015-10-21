class Admin::CandidatesController < ApplicationController
  include Admin::CandidatesHelper
  before_action :set_candidate, :set_slug

  def show
    @candidate = set_candidate
    @donations_by_date = []
    @candidate.donations.map do |donation|
      @donations_by_date << [donation.created_at.strftime("%d"), donation.amount]
    end
    @donations_by_date = @donations_by_date.unshift(["Date", "amount"]).to_json
  end

  def edit
  end

  def update
  end

  private

  def set_candidate
    if current_user.user_roles.first.role_id == 2
      current_candidate
    else
      @current_candidate ||= Candidate.find_by(slug: params[:candidate])
    end
  end

  def set_slug
    if current_user.user_roles.first.role_id == 2 &&
       Candidate.find_by(slug: params[:candidate]) != current_candidate
      redirect_to admin_candidate_path(current_candidate.slug)
    else
      @current_candidate = Candidate.find_by(slug: params[:candidate])
    end
  end
end
