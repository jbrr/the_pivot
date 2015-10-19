class Admin::UserRolesController < ApplicationController
  def update
    if params[:value] == "Decline"
      decline_applicant
      redirect_to admin_dashboard_path
    elsif params[:value] == "Approve"
      approve_applicant
      redirect_to admin_dashboard_path
    end
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
    UserRole.find(params[:id])
  end
end
