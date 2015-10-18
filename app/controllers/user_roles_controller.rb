class UserRolesController < ApplicationController
  def edit
  end

  def update
    user_role = UserRole.find(params[:id])
    user_role.update(user_role_params)
    # require 'pry'; binding.pry
    redirect_to candidate_path(params[:user_role][:candidate_id])
  end

  private

  def user_role_params
    params.require(:user_role).permit(:reason, :candidate_id, :role_id)
  end
end
