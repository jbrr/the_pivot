class Admin::DashboardController < ApplicationController
    def index
      @applicants = UserRole.where("reason is not null")
    end
end
