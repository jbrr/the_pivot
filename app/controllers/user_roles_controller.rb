class UserRolesController < ApplicationController
  def edit
  end

  def update
    require 'pry' ; binding.pry
    user_role = UserRole.find_by(user_id: current_user.id)
    user_role.update(user_role_params)
    redirect_to candidate_path(params[:user_role][:candidate_id])
  end

  private

  def user_role_params
    params.require(:user_role).permit(:reason, :candidate_id, :role_id)
  end
end
