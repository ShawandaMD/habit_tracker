class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if params[:user][:password] != params[:user][:password_confirmation]
      redirect_to controller: 'users', action: 'new'
    else
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(current_user)
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)

  end
end
