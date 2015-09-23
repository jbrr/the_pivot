class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to profile_path(@user)
    else
      flash[:errors] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
    end

end
