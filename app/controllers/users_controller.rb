class UsersController < ApplicationController

  def new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] =@user.id
      redirect_to user_path(@user)
      flash[:notice] = "Welcome to waterspot."
    else
      flash[:error] = "invalid information"
      render :new
    end
  end

  private

  def user_params
   params.require(:user).permit(:email, :username, :avatar, :password, :password_confirmation)
  end

end
