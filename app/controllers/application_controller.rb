class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception
  before_action :authorize!
  helper_method :current_user
  helper_method :current_candidate
  helper_method :cart

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_candidate
    cid                = current_user.user_roles.last.candidate_id
    @current_candidate ||= Candidate.find_by(id: cid)
  end

  def cart
    Cart.new(session[:donations])
  end

  def current_permission
    @current_permission ||= Permission.new(current_user)
  end

  def authorize!
    unless authorized?
      flash[:errors] = "STRANGER DANGER"
      redirect_to root_url
    end
  end

  def authorized?
    current_permission.allow?(params[:controller], params[:action])
  end
end
