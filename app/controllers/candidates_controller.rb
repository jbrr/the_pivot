class CandidatesController < ApplicationController
  def index
    @democrats = Candidate.where(party: "Democratic")
    @republicans = Candidate.where(party: "Republican")
  end

  def show
    @candidate = Candidate.find(params[:id])
  end

  def update
    candidate = Candidate.find(params[:id])
    if candidate.update(candidate_params)
      redirect_to edit_admin_candidate_path(candidate: candidate.slug)
    else
      flash[:errors] = "Whateverrr"
      redirect_to root_path
    end
  end

  private

  def candidate_params
    params.require(:candidate).permit(:bio)
  end
end
