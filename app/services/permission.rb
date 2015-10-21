class Permission
  extend Forwardable
  include ApplicationHelper
  attr_reader :user, :controller, :action

  def_delegators :@user, :platform_admin?, :campaign_manager?, :registered_user?, :pending_user?

  def initialize(user)
    @user = user || User.new
  end

  def allow?(controller, action)
    @controller = controller
    @action = action

    case
    when platform_admin?
      platform_admin_permissions
    when campaign_manager?
      campaign_manager_permissions
    when registered_user?
      registered_user_permissions
    when pending_user?
      pending_user_permissions
    else
      guest_user_permissions
    end
  end

  def platform_admin_permissions
    true
  end

  def campaign_manager_permissions
    return true unless controller == "admin/dashboard"
  end

  def registered_user_permissions
    return true if controller == "sessions"
    return true if controller == "candidates"  && action.in?(%w(index show))
    return true if controller == "cart"
    return true if controller == "charges"
    return true if controller == "donations"
    return true if controller == "issues"  && action.in?(%w(index show))
    return true if controller == "orders"
    return true if controller == "user_roles"
    return true if controller == "users"  && action.in?(%w(new create show))
    return true if controller == "welcome" && action.in?(%w(index))
  end

  def guest_user_permissions
    return true if controller == "sessions"
    return true if controller == "candidates"  && action.in?(%w(index show))
    return true if controller == "cart"
    return true if controller == "donations"
    return true if controller == "issues"  && action.in?(%w(index show))
    return true if controller == "users"  && action.in?(%w(new create))
    return true if controller == "welcome" && action.in?(%w(index))
  end

  def pending_user_permissions
    return true if controller == "sessions"
    return true if controller == "candidates"  && action.in?(%w(index show))
    return true if controller == "cart"
    return true if controller == "donations"
    return true if controller == "issues"  && action.in?(%w(index show))
    return true if controller == "users"  && action.in?(%w(new create))
    return true if controller == "welcome" && action.in?(%w(index))
    return true if controller == "two_factor_authentication"
  end

end
