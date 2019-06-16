class ApplicationController < ActionController::Base
  helper_method :current_user, :require_login, :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_login
    if !logged_in?
        flash[:notice] = "You must be logged in."
        redirect_to :root
    end
  end

  def logged_in?
    if session[:user_id]
      flash[:notice] = "Welcome back! You are already logged in."
    end
  end
end
