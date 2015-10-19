class Admin::CampaignManagersController < ApplicationController
  def new
    @user = User.new
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

  def create_user_role
    role = Role.find_by(name: "campaign_manager")
    UserRole.create(user_id: @user.id, role_id: role.id,
                                       candidate_id: current_candidate.id)
  end
end
