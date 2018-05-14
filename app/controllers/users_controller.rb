class UsersController < ApplicationController

  def new
  end

  def create #signup
    @user = User.new(user_params)
    @user.save
    byebug
    if params[:user][:password] != params[:user][:password_confirmation]
      redirect_to controller: 'users', action: 'new'
    else
      session[:user_id] = @user.id #logs them in
      redirect_to controller: 'welcome', action: 'home'
    end
=begin
    if @user.id != nil
      redirect_to controller: 'welcome', action: 'home'
    else
      session[:user_id] = @user.id
      redirect_to controller: 'users', action: 'new'
    end
=end
  end

  def show

  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)

  end

end
