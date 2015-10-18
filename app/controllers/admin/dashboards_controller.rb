class Admin::DashboardsController < ApplicationController
    def index

    end

    def show

    end

    def new
      @user = User.new
    end

    def update

    end

    def create
      @user = User.new(new_campaign_manager_params)
      if @user.save
        redirect_to admin_candidate_path(current_candidate.slug)
      else
        render :new
      end
    end

    def destroy

    end

    private

    def new_campaign_manager_params
      params.require(:user).permit(:first_name, :last_name, :email,
                                   :phone_number, :username, :password,
                                   :password_confirmation, :candidate_id,
                                   :role_id)
    end
end
