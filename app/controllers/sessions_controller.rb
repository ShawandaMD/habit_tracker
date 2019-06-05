class SessionsController < ApplicationController
  def welcome
  end

  #log in
  def new
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
  end

end
