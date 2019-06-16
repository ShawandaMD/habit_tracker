class SessionsController < ApplicationController
  def welcome
  end

  #log in
  def new
    @user = User.new
    render 'login'
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.try(:authenticate, params[:user][:password])
       session[:user_id] = @user.id
       redirect_to user_path(@user.id)
    else
      @user ||=
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
