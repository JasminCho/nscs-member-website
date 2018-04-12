class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    session[:user_email] = user.email

    redirect_to root_path
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
