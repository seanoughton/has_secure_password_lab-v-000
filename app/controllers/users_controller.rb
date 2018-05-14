class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create #signup

    @user = User.create(user_params)
    return redirect_to controller: 'users', action: 'new' unless @user.save
    #if it can't be saved then then the password and password_confirmation did not match
    session[:user_id] = @user.id
    redirect_to controller: 'welcome', action: 'home'
=begin
    if params[:user][:password] != params[:user][:password_confirmation]
      redirect_to controller: 'users', action: 'new'
    else
      @user = User.create(user_params)
      session[:user_id] = @user.id #logs them in
      redirect_to controller: 'welcome', action: 'home'
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
