class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to profile_path
    else
      flash.now[:errors] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @user = User.find(session[:user_id])
    @orders_completed = User.completed(@user.id)
    @orders_pending   = User.pending(@user.id)
    @orders_cancelled = User.cancelled(@user.id)
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
    end
end
