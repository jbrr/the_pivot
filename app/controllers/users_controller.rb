class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(pending_user_params)
    if @user.save!
      create_user
      redirect_to  two_factor_authentication_path(@user.id)
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
    def pending_user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :username, :password, :password_confirmation, :sent_code, :auth_code)
    end

    def create_user
      session[:user_id] = @user.id
      role = Role.find_by(name: "pending_user")
      @user.user_roles << UserRole.create(user_id: @user.id, role_id: role.id)
      two_factor
    end

    def two_factor
      Crusher.send_phone_password(current_user)
    end

end
