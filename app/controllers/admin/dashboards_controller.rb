class Admin::DashboardsController < ApplicationController

    def show
      @applicants = UserRole.where("reason is not null")
    end

    def new
      @user = User.new
    end

    def update
      if params[:value] == "Decline"
        decline_applicant
        redirect_to admin_dashboard_path
      elsif params[:value] == "Approve"
        approve_applicant
        redirect_to admin_dashboard_path
      end
    end

    def create
      @user = User.new(new_campaign_manager_params)
      if @user.save
        @user.user_roles << create_user_role
        redirect_to admin_candidate_path(current_candidate.slug)
      else
        render :new
      end
    end

    private

    def new_campaign_manager_params
      params.require(:user).permit(:first_name, :last_name, :email,
                                   :phone_number, :username, :password,
                                   :password_confirmation)
    end

    private

    def decline_applicant
      applicant_id.update(reason: nil)
    end

    def approve_applicant
      applicant_role = Role.find_by(name: "campaign_manager")
      applicant_id.update(role_id: applicant_role.id)
      applicant_id.update(reason: nil)
    end

    def applicant_id
      UserRole.find(params[:user_role_id])
    end

    def create_user_role
      role = Role.find_by(name: "campaign_manager")
      UserRole.create(user_id: @user.id, role_id: role.id,
                                         candidate_id: current_candidate.id)
    end
end
