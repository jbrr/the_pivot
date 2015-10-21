class CandidatesController < ApplicationController
  def index
    @democrats = Candidate.where(party: "Democratic")
    @republicans = Candidate.where(party: "Republican")
  end

  def show
    @candidate = candidate_id
    @registered = current_user.registered_user? if current_user
    @tweet_uri = TwitterService.new.first_tweet_link("realdonaldtrump")
    @embedded_tweet = TwitterEmbed.new.embedded_tweet(@tweet_uri)
  end

  def update
    if candidate.update(candidate_params)
      flash[:success] = "Bio Successfully Updated"
      redirect_to edit_admin_candidate_path(candidate: candidate.slug)
    else
      flash[:errors] = "Do you even American Bro?"
      redirect_to edit_admin_candidate_path(candidate: candidate.slug)
    end
  end

  private

  def candidate_params
    params.require(:candidate).permit(:bio)
  end

  def candidate_id
    Candidate.find(params[:id])
  end

  def candidate
    candidate_id
  end
end
