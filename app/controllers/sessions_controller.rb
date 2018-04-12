class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    if member? user.email 
      session[:user_id] = user.id
      session[:email] = user.email
      redirect_to about_path
    else
      flash.now[:danger] = 'You are not a member!'
      redirect_to root_path
    end    
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
