class Admin::CandidatesController < ApplicationController
  before_action :set_candidate

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
end
