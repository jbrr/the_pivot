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
      # @current_user = current_user
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

    def destroy

    end

    private

    def new_campaign_manager_params
      params.require(:user).permit(:first_name, :last_name, :email,
                                   :phone_number, :username, :password,
                                   :password_confirmation)
    end
end
