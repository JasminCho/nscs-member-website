class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    puts "These are the tokens in omniauth.auth"
    puts request.env["omniauth.auth"]
    #log_in(user) #check members_helper
=begin
    if login_in(user.id)
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to root_path
    end
=end
    session[:user_id] = user.id #if statement check if user is in member here
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
