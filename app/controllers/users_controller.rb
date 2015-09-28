class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    require "pry"
    binding.pry
    if @user.save
      session[:user_id] = @user.id
      redirect_to profile_path
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
      params.require(:join).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
    end

end
