class Admin::DashboardController < ApplicationController
    def index
      @applicants = UserRole.where("reason is not null")
      @candidates = Candidate.all
    end
end
