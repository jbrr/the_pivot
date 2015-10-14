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
      flash[:success] = "Bio Successfully Updated"
      redirect_to edit_admin_candidate_path(candidate: candidate.slug)
    else
      flash[:danger] = "Do you even American Bro?"
      redirect_to edit_admin_candidate_path(candidate: candidate.slug)
    end
  end

  private

  def candidate_params
    params.require(:candidate).permit(:bio)
  end
end
