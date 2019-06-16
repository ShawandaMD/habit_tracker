class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]

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

  def show
    @user = User.find(params[:id])
    if @user == current_user
      render :show
    else
      redirect_to root_path
    end  
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
