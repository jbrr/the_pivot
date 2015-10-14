class Admin::CandidatesController < ApplicationController
  before_action :current_candidate

  def index
    current_candidate
  end

  def show
    current_candidate
  end

  def edit
  end

  def update
  end

  private

  def current_candidate
    @current_candidate ||= Candidate.find_by(slug: params[:candidate])
  end
end
