class Permission
  attr_reader :user, :controller, :action

  def initialize(user)
    @user = user
  end

  def allow?
    @controller = controller
    @action = action

    case
    when candidate_admin?
      candidate_admin_permissions
    when campaign_manager?
      campaign_manager_permissions
    when registered_user?
      registered_user_permissions
    else
      guest_user_permissions
  end

  end
end
