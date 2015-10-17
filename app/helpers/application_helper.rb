module ApplicationHelper

  def validate_params
    params[:donation][:amount].to_i > 0
  end

  def bootstrap_class_for flash_type
    { success: "alert-success", errors: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def bootstrap_icon_for flash_type
    { success: "ok", errors: "remove-circle", alert: "warning-sign", notice: "exclamation-sign" }[flash_type.to_sym] || "question-sign"
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
        concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
        concat content_tag(:i, nil, class: "glyphicon glyphicon-#{bootstrap_icon_for(msg_type)}")
        concat message
        end)
      end
    nil
  end

  def candidate_issue_raised_total(candidate_issue)
    completed_orders = Order.where(status: "completed")
    completed_donations = Donation.where(order_id: completed_orders)
    stance_donations = completed_donations.where(candidate_issue_id: candidate_issue)
    stance_donations.inject(0) {|sum, x| sum + x.amount}
  end

  def percent_calculation(candidate_issue)
    candidate_issue_raised_total(candidate_issue.id).to_f / candidate_issue.goal.to_f * 100
  end

  def progress_bar_percentage(candidate_issue)
    if percent_calculation(candidate_issue).nan?
      0
    elsif percent_calculation(candidate_issue) > 100
      100
    else
      percent_calculation(candidate_issue)
    end
  end

  def current_user_role
    UserRole.find_by(user_id: current_user.id)
  end
end
