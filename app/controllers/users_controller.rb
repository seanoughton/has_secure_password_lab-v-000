class UsersController < ApplicationController

  def new
  end

  def create
    byebug
    user = User.new(user_params).save
  end

  def show

  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)

  end

end
