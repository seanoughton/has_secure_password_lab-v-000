class UsersController < ApplicationController

  def new
  end

  def create #signup
    @user = User.new(user_params).save
    session[:user_id] = @user.id
    redirect_to controller: 'welcome', action: 'home'
  end

  def show

  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)

  end

end
