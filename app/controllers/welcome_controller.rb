class WelcomeController < ApplicationController
  def index
    @candidates = Candidate.all
  end
end