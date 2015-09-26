class WelcomeController < ApplicationController
  def index
    @featured_candidates = Candidate.where(featured: true)
    @issues = Issue.where(featured: true)
  end
end