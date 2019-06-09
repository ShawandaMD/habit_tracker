class SessionsController < ApplicationController
  def welcome
  end

  #log in
  def new
    @user = User.new
    if logged_in?
      redirect_to users_path(current_user)
    else
      render 'login'
    end
  end

  def create
    @user =  User.find_by(email: params[:user][:email])
    return head(:forbidden) unless @user.try(:authenticate, params[:user][:password])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  private
  #def user_params
  #  params.require(:user).permit(:name, :email, :password, :password_confirmation)
  #end

end
