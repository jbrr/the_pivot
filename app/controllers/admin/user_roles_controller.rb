class Admin::UserRolesController < ApplicationController
  def update
    applicant_id = UserRole.find(params[:id])
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
end
