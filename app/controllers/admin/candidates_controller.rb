class Admin::CandidatesController < ApplicationController
  before_action :set_candidate, :set_slug

  def show
  end

  def edit
  end

  def update
  end

  private

  def set_candidate
    cid                = current_user.user_roles.first.candidate_id
    @current_candidate = Candidate.find_by(id: cid)
  end

  def set_slug
    if Candidate.find_by(slug: params[:candidate]) != @current_candidate
      redirect_to admin_candidate_path(@current_candidate.slug)
    end
  end
end
