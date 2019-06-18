class SessionsController < ApplicationController
  before_action :logged_in?

  def welcome
  end

  #log in
  def new
    @user = User.new
    if logged_in?
      redirect_to user_path(current_user.id)
    else
      render 'login'
    end
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.try(:authenticate, params[:user][:password])
       session[:user_id] = @user.id
       redirect_to user_path(@user.id)
    elsif
      !@user
      redirect_to :root
      flash[:notice] = "Email does not exist. Please sign up."
    else
      render 'login'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to :root
  end

  private
  #def user_params
  #  params.require(:user).permit(:name, :email, :password)
  #end

end
