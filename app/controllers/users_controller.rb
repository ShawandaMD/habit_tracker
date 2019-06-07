class UsersController < ApplicationController
  def new
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
end
