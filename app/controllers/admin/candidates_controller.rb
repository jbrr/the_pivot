class Admin::CandidatesController < ApplicationController
  before_action :current_candidate, :set_slug

  def show
  end

  def edit
  end

  def update
  end

  private

  def current_candidate
    if current_user.user_roles.first.role_id == 2
      cid                = current_user.user_roles.first.candidate_id
      @current_candidate = Candidate.find_by(id: cid)
    else
      @current_candidate ||= Candidate.find_by(slug: params[:candidate])
    end
  end

  def set_slug
    if current_user.user_roles.first.role_id == 2 &&
       Candidate.find_by(slug: params[:candidate]) != @current_candidate
      redirect_to admin_candidate_path(@current_candidate.slug)
    else
      @current_candidate = Candidate.find_by(slug: params[:candidate])
    end
  end
end
