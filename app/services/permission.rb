class Permission
  extend Forwardable
  include ApplicationHelper
  attr_reader :user, :controller, :action

  def_delegators :@user, :platform_admin?, :campaign_manager?, :registered_user?

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
    else
      guest_user_permissions
    end
  end

  def platform_admin_permissions
    true
  end

  def campaign_manager_permissions
    # return true if controller == "sessions"
    # return true if controller == "items"  && action.in?(%w(index show))
    # return true if controller == "stores" && action.in?(%w(index show))
    # return true if controller == "orders" && action.in?(%w(index show))
  end

  def registered_user_permissions
    return true if controller == "sessions"
    return true if controller == "candidates"  && action.in?(%w(index show))
    return true if controller == "cart" && action.in?(%w(index show))
    return true if controller == "charges"  && action.in?(%w(index show))
    return true if controller == "donations" && action.in?(%w(index show))
    return true if controller == "issues"  && action.in?(%w(index show))
    return true if controller == "orders" && action.in?(%w(index show))
    return true if controller == "users"  && action.in?(%w(index show))
    return true if controller == "welcome" && action.in?(%w(index show))
  end

  def guest_user_permissions
    return true if controller == "sessions"
    return true if controller == "welcome"  && action.in?(%w(index show))
    return true if controller == "candidates" && action.in?(%w(index))
  end

end
