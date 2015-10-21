class TwoFactorAuthenticationController < ApplicationController

  def show
    @user = current_user
  end

  def update
    if params[:user][:auth_code] == current_user.sent_code
      current_user_update
      redirect_to profile_path(current_user)
    else
      flash[:errors] = "Please input the correct authentication code!"
      render :show
    end
  end

  private

  def current_user_update
    role = Role.find_by(name: "registered_user")
    current_user.user_roles << UserRole.create(user_id: current_user.id,
                                               role_id: role.id)
  end
end
