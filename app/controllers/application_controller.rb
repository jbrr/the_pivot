class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :cart

  def cart
    Cart.new(session[:donations])
  end

  include ApplicationHelper
end
