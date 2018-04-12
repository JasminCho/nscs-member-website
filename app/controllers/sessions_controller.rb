class SessionsController < ApplicationController
  
 
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    puts "These are the tokens in omniauth.auth"
    puts request.env["omniauth.auth"]
    debugger
    if member? user.name #this is actually email if you use tamu email
      session[:user_id] = user.id
      session[:email] = user.name
      redirect_to root_path
    else
      flash.now[:danger] = 'You are not a member!'
      redirect_to root_path
    end    
    session[:email2] = user.name
  end

  def destroy
    reset_session
    current_user2
    redirect_to root_path
  end
end
