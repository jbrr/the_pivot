module ApplicationHelper

  def validate_params
    params[:donation][:amount].to_i > 0
  end
end
