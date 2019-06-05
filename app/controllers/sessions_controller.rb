class SessionsController < ApplicationController
  def welcome
  end

  #log in
  def new
    if logged_in?
      redirect_to users_path(current_user)
    else
      render '/login'  
    end
  end

end
