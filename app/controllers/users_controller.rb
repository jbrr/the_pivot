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
    @orders_completed = Order.where("user_id = ? AND status = ? ", @user.id, "completed")
    @orders_pending = Order.where("user_id = ? AND status = ? ", @user.id, "pending")
    @orders_cancelled = Order.where("user_id = ? AND status = ? ", @user.id, "cancelled")
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :username, :password, :password_confirmation)
    end

end
