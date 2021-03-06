class ApplicationController < ActionController::Base
  helper_method :current_user, :require_login, :logged_in?
  protect_from_forgery unless: -> { request.format.json? }

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_habit
    @current_habit ||= Habit.find_by(id: params[:habit_id])
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
