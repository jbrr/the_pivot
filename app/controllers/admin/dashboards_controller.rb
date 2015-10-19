class Admin::DashboardsController < ApplicationController

    def show
      @applicants = UserRole.where("reason is not null")
    end

    def new
      @user = User.new
    end

    def update
      applicant_id = UserRole.find(params[:user_role_id])
      if params[:value] == "Decline"
        applicant_id.update(reason: nil)
        redirect_to admin_dashboard_path
      elsif params[:value] == "Approve"
        applicant_role = Role.find_by(name: "campaign_manager")
        applicant_id.update(role_id: applicant_role.id)
        applicant_id.update(reason: nil)
        redirect_to admin_dashboard_path
      end
    end

    def create
      @user = User.new(new_campaign_manager_params)
      if @user.save
        role = Role.find_by(name: "campaign_manager")
        @user.user_roles << UserRole.create(user_id: @user.id, role_id: role.id,
                                            candidate_id: current_candidate.id)
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
end
